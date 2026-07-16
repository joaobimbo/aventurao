# Walkthrough e puzzles

Este documento descreve o percurso atualmente implementado até à Room 7. A Room 5 existe, mas ainda não tem jogabilidade e não faz parte do fluxo atual.

## Estado inicial

`Game.agf` tem `cGabriel.StartingRoom = 7`, usado como arranque de teste da cozinha. Para percorrer a história completa, a sala inicial deve ser alterada para a Room 1.

Itens marcados como iniciais:

- `iOboe` — Oboé.
- `iKey` — Key, ainda sem função definida.

## Room 1 — quarto

Objetivo: praticar oboé para poder ir para a cama.

### Preparar o oboé

1. Olhar para `oCup` para revelar `oReed`.
2. Apanhar a palheta.
3. Combinar `iReed` com `iOboe`.
4. O resultado é `iOboeR`.

### Fazer cair a partitura

1. Interagir com o sofá para revelar `oNerfs`.
2. Apanhar os Nerfs e a pistola descarregada (`oObject1`).
3. Combinar `iNerfs` com `iPistol` para obter `iPistolL`.
4. Usar a pistola carregada em `hDesenho`.
5. A animação faz cair `oPartitura` e define a propriedade `Pickable = true`.
6. Apanhar a partitura.

### Praticar

1. Usar `iPartitura` em `hTripe` ou `oTripe`.
2. A partitura é consumida, `partitura_on_tripe` passa a `true` e o tripé muda para o sprite 384.
3. Usar `iOboeR` no tripé.
4. A primeira prática define `gabriel_practiced_oboe = true`; práticas seguintes repetem apenas animação e comentário.
5. Interagir com a cama para mudar para a Room 2.

## Room 2 — missão da mãe

Interagir com `hPorta` faz Vânia dizer a Gabriel para ir buscar o Pai à Universidade e muda para a Room 10.

Esta sala ainda tem pouca interação e deve ser testada como transição narrativa.

## Room 10 — ligação provisória

- `hHotspot2` leva à Room 3, Porta Férrea.
- `hParaCasa` regressa à Room 2.

A Room 10 funciona como hub provisório. A Room 5/Estação poderá substituí-la ou complementá-la quando for implementada.

## Room 3 — Porta Férrea

Objetivo: ultrapassar os praxistas.

1. Apanhar os cartazes (`iFolhetos`).
2. Apanhar os copos usados (`iCopos`).
3. Usar ambos no caixote, em qualquer ordem.
4. A funcionária troca o saco e deixa `oSacoLimpo`.
5. Apanhar o saco (`iSacoLixo`).
6. Interagir com o item ou usá-lo em Gabriel para vestir o disfarce.
7. Falar com os praxistas e escolher:
   1. “...quem vos ensinou essa dobra?”
   2. “Vocês ainda usam essa dobra?”
   3. “Código da Praxe, artigo 47-B: dobra obsoleta. Reaprendizagem imediata.”
   4. “Sanção 3-C: reaprendizagem coletiva fora do perímetro. Imediatamente.”
8. Esperar o grupo sair e interagir com a Porta Férrea para entrar na Room 4.

Escolhas erradas fecham ou recuam o diálogo, mas permitem tentar novamente.

## Room 4 — O Exame Impossível

Objetivo: ajudar Luís a terminar o exame e encontrar as chaves.

1. Falar com Luís para conhecer o problema.
2. Apanhar régua e fita-cola; combiná-las.
3. Usar `iReguaComFita` no armário baixo para obter o rascunho.
4. Interagir com a estante para obter a página 47 da grelha.
5. Voltar a interagir com o armário para revelar o pó.
6. Apanhar frasco, copo de água e pó.
7. Combinar frasco + água → frasco com água.
8. Combinar frasco com água + pó → suspensão.
9. Usar a suspensão em Luís.
10. Falar com Luís até ele mencionar as chaves.
11. Interagir com a pilha de exames, apanhar `iChavesLuis` e falar novamente com Luís.
12. O episódio conclui e o fluxo atual muda diretamente para a Room 6.

## Room 5 — Estação Fernando Namora

Ainda não jogável. Existem `room5.crm`, o background `Assets/estacao_fernando_namora_room5.png` e a fonte em alta resolução, mas `room5.asc` contém apenas o cabeçalho. Não há transições ativas para esta sala.

## Room 6 — entrada do Moinho Velho

Objetivo: entrar na cozinha disfarçado de ajudante.

1. Interagir com o banco para o colocar sob o avental.
2. Pegar/interagir com o avental.
3. Pegar/interagir com a caixa de chapéus.
4. Com as duas peças, falar com a empregada ou usar a porta da cozinha.
5. Gabriel apresenta-se como novo ajudante e entra na Room 7.

A ordem de avental e chapéu é livre, mas o avental exige primeiro o banco.

## Room 7 — cozinha do Moinho Velho

### Cartaz grego

Responder ao pasteleiro:

> Que não entre quem não souber geometria.

Depois, voltar a falar com ele para iniciar as ampulhetas.

### Ampulhetas de 4 e 7 minutos

1. Virar a de 4.
2. Virar a de 7; a cobertura entra no forno.
3. Esperar (tempo 4).
4. Virar a de 4.
5. Esperar (tempo 7).
6. Virar a de 7.
7. Esperar (tempo 8).
8. Virar novamente a de 7.
9. Esperar (tempo 9).
10. Tirar a cobertura.

O jogo mostra sempre o tempo e o restante de cada ampulheta. Uma cobertura acima de 9 minutos queima e reinicia o puzzle.

### Atribuir os bolos

Depois das ampulhetas, os cinco bolos e o livro aparecem. Examinar tudo e falar com o pasteleiro. Atribuir, por ordem:

1. Bolo A — Mariana.
2. Bolo B — Tiago.
3. Bolo C — Rita.
4. Bolo D — Gabriel.
5. Bolo E — Patrícia.

Uma lista errada é apagada por completo. A lista correta entrega `iBirthdayCake` e conclui a pastelaria.

## Fim atual e inconsistências

- A porta da cozinha (Room 7) regressa à Room 2 depois de concluir.
- A saída da loja (Room 6) regressa à Room 1 depois de concluir.
- A Room 5 ainda não participa no percurso.
- `cGabriel.StartingRoom` continua em 7 para testes.

Estas rotas devem ser harmonizadas antes de considerar o arco completamente fechado.

## Teste integral recomendado

1. Começar na Room 1 apenas com `iOboe` e `iKey`.
2. Percorrer `1 → 2 → 10 → 3 → 4 → 6 → 7` sem adicionar itens por debug.
3. Guardar/carregar pelo menos uma vez nas Rooms 3, 4 e 7.
4. Confirmar inventário e views depois de cada transição.
5. Obter o bolo e verificar a rota final escolhida.
