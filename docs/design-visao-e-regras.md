# Design, visão e regras

## Ideia central

`Aventurao` é uma aventura point-and-click em português sobre Gabriel, um rapaz de 9 anos que transforma tarefas banais num percurso heroico. O humor nasce do contraste entre a confiança de Gabriel e um mundo de adultos, objetos e regras que leva o absurdo muito a sério.

O arco atualmente implementado leva Gabriel do quarto à Universidade de Coimbra e daí à pastelaria Moinho Velho:

1. Room 1 — pratica oboé antes de se poder deitar.
2. Room 2 — recebe da mãe a missão de ir buscar o Pai à Universidade.
3. Room 10 — funciona como ligação entre a casa e a Porta Férrea.
4. Room 3 — engana os praxistas com um saco do lixo vestido como capa.
5. Room 4 — ajuda Luís a corrigir o último exame e recupera as chaves.
6. Room 6 — disfarça-se de ajudante para entrar na cozinha do Moinho Velho.
7. Room 7 — resolve os desafios do cartaz grego, das ampulhetas e dos bolos.

A Room 5 existe no projeto e tem background da Estação Fernando Namora, mas ainda não possui jogabilidade (`room5.asc` está vazio). O fluxo atual salta da Room 4 diretamente para a Room 6.

## Tom e linguagem

- Humor seco, infantil-esperto e ligeiramente dramático.
- Gabriel comenta objetos comuns como se tivessem personalidade, intenções ou autoridade.
- Os adultos aceitam situações absurdas com seriedade: a praxe inventa regulamentos, o Pai trata uma correção como investigação científica e o pasteleiro transforma bolos em matemática.
- Respostas de erro devem dar uma pista ou revelar personalidade; evitar mensagens genéricas como “Não podes fazer isso”.
- O jogo continua em português europeu.
- O projeto declara UTF-8, mas parte do texto dos scripts usa ASCII para evitar regressões de encoding no AGS. Não fazer correções de acentos em massa sem testar no editor.

Exemplos de voz:

- “Uma porta. O universo inventou isso para me contrariar.”
- “A geometria também serve para alinhar pequenos delitos.”
- “Cinco praxistas muito juntos. Parecem uma única criatura académica.”
- “Bolos atrás de vidro. Uma medida de segurança sensata e cruel.”

## Regras de interação

- O jogador controla Gabriel (`cGabriel`).
- A interface principal é uma verb coin, não uma barra fixa de verbos.
- Verbos principais: `Olhar`, `Falar`, `Usar` e `Pegar`.
- Clique esquerdo num hotspot, objeto ou personagem abre a verb coin.
- Clique esquerdo numa zona sem alvo faz Gabriel andar.
- Clique direito abre o inventário quando não há outra interface ativa; também fecha ou cancela interfaces.
- Clique esquerdo num item de inventário seleciona-o.
- Clique esquerdo noutro item tenta combinar os dois.
- Clique direito num item examina-o.
- Com um item ativo, clicar no mundo usa-o no alvo.
- `Escape` fecha a interface atual; sem interface aberta, mostra o painel.

## Regras de puzzle

- A solução deve resultar de observação, diálogo e combinação de objetos.
- Objetos podem ser revelados depois de examinar ou manipular o cenário.
- As combinações devem consumir os componentes e adicionar um único item resultante.
- Mudanças importantes têm estado persistente em variáveis globais ou da sala.
- Tentativas erradas devem permitir continuar sem bloquear o jogo.
- Puzzles de diálogo podem ter várias etapas, mas o jogador deve conseguir repetir o diálogo.

Combinações implementadas:

- `iPistol` + `iNerfs` → `iPistolL`.
- `iOboe` + `iReed` → `iOboeR`.
- `iRegua` + `iFitaCola` → `iReguaComFita`.
- `iFrasco` + `iCopoAgua` → `iFrascoComAgua`.
- `iFrascoComAgua` + `iPoEfervescente` → `iSuspensao`.

## Estrutura narrativa implementada

### Quarto e oboé

A pistola Nerf carregada faz cair a partitura. A palheta prepara o oboé. Gabriel coloca a partitura no tripé, pratica e só então pode usar a cama para avançar.

### Porta Férrea

Gabriel enche o caixote com cartazes e copos, espera a funcionária trocar o saco, apanha o saco limpo e veste-o como capa. Os praxistas confundem confiança com autoridade e saem para “reaprender” uma dobra inventada.

### Gabinete de Luís

Gabriel improvisa uma régua pegajosa para recuperar um rascunho, encontra a página 47 da grelha, prepara uma suspensão e ajuda o Pai a identificar a resposta. Depois procura as chaves sob os exames.

### Moinho Velho

Gabriel veste avental e chapéu para entrar na cozinha. Interpreta o cartaz grego, mede exatamente nove minutos com ampulhetas de 4 e 7 minutos e atribui corretamente cinco bolos aos respetivos donos. Recebe `iBirthdayCake` no fim.

## Decisões ainda abertas

- Definir o papel definitivo da Room 5/Estação e integrá-la no fluxo.
- Harmonizar as transições de regresso depois da Room 7.
- Decidir a função de `iKey`, que ainda é um item inicial sem uso documentado.
- Rever o início de jogo: `cGabriel.StartingRoom` está atualmente em `7`, útil para testes, mas não para o percurso narrativo completo.
