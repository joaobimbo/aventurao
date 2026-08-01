# Rooms 6 e 7 — Pastelaria Moinho Velho

## Estado atual

O episódio da pastelaria está implementado:

- Room 6: entrada/frontdesk e puzzle do disfarce (`room6.asc`).
- Room 7: cozinha, cartaz grego, ampulhetas e bolos (`room7.asc` + `GlobalScript.asc`).
- Dialogs: `dCartazGrego`, `dIntroducaoAmpulhetas`, `dAmpulhetas`, `dIntroducaoBolos` e `dEscolherBolo` em `Game.agf`.
- Backgrounds: `Assets/pastelaria_entrada_room6.png` e `Assets/pastelaria_cozinha_room7.png`.
- Personagens e objetos: `Sprites/Room6/`.

Gabriel chega com Luís depois do episódio da Universidade, mas o argumento da pastelaria concentra-se em obter o bolo de aniversário.

## Room 6 — entrada

### Estado local

- `introducaoVista`.
- `bancoAlinhado`.
- `temAvental`.
- `temChapeu`.
- `empregadaDeixouPassar`.

`EstaDisfarcado()` só devolve `true` quando Gabriel tem avental e chapéu. Estes elementos não entram no inventário: são flags de sala e feedback visual/narrativo.

### Walkthrough

1. Interagir com `hBanco` para o alinhar debaixo do avental.
2. Pegar/interagir com `hAvental` para o vestir.
3. Pegar/interagir com `hChapeus` para colocar um chapéu.
4. Falar com `cEmpregadaPastelaria` ou interagir com `hPortaCozinha`.
5. A empregada aceita Gabriel como novo ajudante, `enteredKitchen` passa a `true` e o jogador muda para a Room 7.

Sem disfarce, a empregada bloqueia a cozinha. Depois de concluir a pastelaria, tentar entrar novamente dá apenas feedback.

### Alvos principais

- `hBalcao`: comentários.
- `hPortaCozinha`: chama `TentarEntrarNaCozinha()`.
- `hBanco`: move/alinha o banco.
- `hAvental`: exige o banco alinhado.
- `hChapeus`: coloca o chapéu.
- `hSaida`: bloqueada sem bolo; depois da conclusão muda atualmente para a Room 1.
- `cEmpregadaPastelaria`: normal/speech view `11`, recolocada em `(650,455)` com scaling 90%.

## Room 7 — cozinha

Ao carregar a sala, Gabriel muda para a view `14` (ajudante), `cPasteleiro` é colocado em `(90,550)` e os objetos recebem scaling manual. Os bolos e o livro ficam escondidos até resolver as ampulhetas.

### Puzzle 1 — cartaz grego

O pasteleiro pergunta pelo significado do cartaz. A resposta correta em `dCartazGrego` é:

> Que não entre quem não souber geometria.

As respostas erradas permitem tentar novamente. A correta define `cartazGregoResolvido` através de `dialog_request(73)` e desbloqueia o desafio seguinte.

### Puzzle 2 — nove minutos

Estado global:

- `hourglassElapsed`.
- `glass4Remaining`, `glass7Remaining`.
- `glass4Running`, `glass7Running`.
- `cakeInOven`.
- `ampulhetasResolvidas`.

O tempo só avança quando o jogador escolhe esperar. Virar uma ampulheta que já corre inverte a areia restante (`duração - restante`). A cobertura entra no forno quando as duas ampulhetas estão a correr ao mesmo tempo.

Solução implementada:

1. Virar a ampulheta de 4.
2. Virar a ampulheta de 7; a cobertura entra no forno no minuto 0.
3. Esperar até ao minuto 4.
4. Virar a de 4.
5. Esperar até ao minuto 7.
6. Virar a de 7.
7. Esperar até ao minuto 8.
8. Virar a de 7, ficando 1 minuto por correr.
9. Esperar até ao minuto 9.
10. Tirar a cobertura.

Retirar antes de 9 minutos não resolve. Ultrapassar 9 chama `BurnToppingAndRestart()`, faz fade e reinicia as ampulhetas. Resolver define `ampulhetasResolvidas`, revela bolos/livro e inicia `dIntroducaoBolos`.

### Puzzle 3 — atribuição dos bolos

O livro apresenta nove pistas. Os bolos visíveis são:

| Bolo | Forma | Sabor/cobertura | Decoração |
|---|---|---|---|
| A | redondo | chocolate | futebol |
| B | quadrado | baunilha sem chocolate | flores |
| C | retangular | morango com base de chocolate | cerejas |
| D | hexagonal | caramelo com recheio de chocolate | estrelas |
| E | oval | chocolate negro | oboé de açúcar |

Solução única codificada:

| Bolo | Dono |
|---|---|
| A | Mariana |
| B | Tiago |
| C | Rita |
| D | Gabriel |
| E | Patrícia |

O jogador não escolhe apenas o bolo de Gabriel: ao falar com o pasteleiro, atribui os cinco bolos em sequência. Não há feedback intermédio. Se pelo menos uma resposta estiver errada, a lista inteira é apagada. A solução correta define `boloIdentificado`, `cakePuzzleSolved` e `pastelariaConcluida`, e adiciona `iBirthdayCake` uma única vez.

### Objetos e hotspots

Objetos visuais configurados: `oCartazGrego`, `oAmpulheta4`, `oAmpulheta7`, `oLivroEncomendas`, `oBoloA`–`oBoloE`.

O script ainda conserva hotspots equivalentes (`hCartazGrego`, `hAmpulhetas`, `hLivroEncomendas`, `hBoloA`–`hBoloE`) e alguns handlers de objetos delegam nesses hotspots. Esta arquitetura híbrida funciona como compatibilidade, mas requer teste de clique e pode ser simplificada depois.

### Saída

`hPortaLoja_Interact` só permite sair com `pastelariaConcluida == true`, restaura a view `2` e muda atualmente para a Room 2. A saída da Room 6 regressa à Room 1. Ambas são rotas antigas: para o lançamento, a conclusão deve encaminhar Gabriel para a festa da Room 20 e impedir estes regressos.

## Critérios de validação

- Disfarce incompleto nunca abre a cozinha.
- Cartaz correto desbloqueia ampulhetas; respostas erradas não bloqueiam repetição.
- Estado das ampulhetas sobrevive a fechar/reabrir diálogo e save/load.
- Cobertura crua, perfeita e queimada dão comportamentos distintos.
- Bolos/livro aparecem apenas depois das ampulhetas.
- Atribuição errada reinicia as cinco respostas.
- Solução correta adiciona um único `iBirthdayCake`.
- Objetos, hotspots, baselines e scaling ficam visualmente coerentes.
- A view normal de Gabriel é restaurada ao sair.
