# Walkthrough e puzzles

Percurso pretendido: `1 → 2 → 10 → 3 → 4 → 6 → 7 → 20`. A ligação final entre as Rooms 7 e 20 ainda precisa de ser feita.

## Estado inicial

Gabriel começa na Room 1 apenas com `iOboe`. `iKey` existe no projeto, mas não é inicial nem é necessário.

## Room 1 — quarto

Objetivo: preparar o oboé, fazer cair a partitura e praticar antes de dormir.

1. Olhar para o copo, apanhar a palheta e combiná-la com `iOboe` para criar `iOboeR`.
2. Interagir com o sofá e apanhar Nerfs e pistola.
3. Combinar `iNerfs` com `iPistol` para criar `iPistolL`.
4. Usar a pistola carregada no desenho para fazer cair a partitura.
5. Apanhar a partitura e usá-la no tripé.
6. Usar `iOboeR` no tripé para praticar.
7. Interagir com a cama para avançar para a Room 2.

## Rooms 2 e 10 — caminho para a Universidade

Na Room 2, interagir com a porta inicia a missão de ir buscar Luís. A Room 10 liga a casa à Room 3; a Room 5 não faz parte deste percurso.

## Room 3 — Porta Férrea

1. Apanhar os cartazes e os copos usados.
2. Usar ambos no caixote, em qualquer ordem.
3. Depois da troca do lixo, apanhar o saco limpo.
4. Usar o saco em Gabriel para vestir o disfarce.
5. Falar com os praxistas e escolher, por ordem:
   1. «...quem vos ensinou essa dobra?»
   2. «Vocês ainda usam essa dobra?»
   3. «Código da Praxe, artigo 47-B: dobra obsoleta. Reaprendizagem imediata.»
   4. «Sanção 3-C: reaprendizagem coletiva fora do perímetro. Imediatamente.»
6. Depois de o grupo sair, atravessar a Porta Férrea para a Room 4.

## Room 4 — O Exame Impossível

1. Falar com Luís.
2. Apanhar régua e fita-cola; combiná-las.
3. Usar `iReguaComFita` no armário baixo para obter o rascunho.
4. Interagir com a estante para obter a página 47 da grelha.
5. Voltar ao armário para revelar o pó.
6. Apanhar frasco, copo de água e pó.
7. Combinar frasco + água; depois frasco com água + pó.
8. Usar `iSuspensao` em Luís.
9. Falar com Luís até ele mencionar as chaves.
10. Interagir com a pilha de exames, apanhar as chaves e falar novamente com Luís.
11. Seguir para a Room 6.

## Room 6 — entrada do Moinho Velho

1. Alinhar o banco por baixo do avental.
2. Vestir o avental.
3. Tirar um chapéu da caixa.
4. Falar com a empregada ou usar a porta da cozinha.
5. Entrar na Room 7 como ajudante.

## Room 7 — cozinha

### Cartaz grego

Responder: «Que não entre quem não souber geometria.»

### Ampulhetas de 4 e 7 minutos

1. Virar a de 4.
2. Virar a de 7; a cobertura entra no forno.
3. Esperar até ao minuto 4 e virar a de 4.
4. Esperar até ao minuto 7 e virar a de 7.
5. Esperar até ao minuto 8 e virar novamente a de 7.
6. Esperar até ao minuto 9 e tirar a cobertura.

Acima de nove minutos, a cobertura queima e o puzzle reinicia.

### Atribuição dos bolos

| Bolo | Dono |
|---|---|
| A | Mariana |
| B | Tiago |
| C | Rita |
| D | Gabriel |
| E | Patrícia |

Uma lista errada é apagada por completo. A correta entrega `iBirthdayCake` uma única vez.

## Room 20 — festa de aniversário

Final pretendido: Gabriel regressa com o bolo, a família canta os parabéns e o jogo apresenta créditos ou uma opção clara para terminar. A sala existe, mas a transição a partir da Room 7 e o encerramento ainda precisam de ser implementados.

## Teste do percurso

- Jogar sem adicionar itens por debug.
- Guardar/carregar pelo menos uma vez nas Rooms 3, 4, 7 e 20.
- Confirmar a view normal de Gabriel depois dos disfarces.
- Confirmar que itens recolhidos ou consumidos não reaparecem.
- Confirmar que Luís chega à pastelaria.
- Obter o bolo uma única vez e chegar à Room 20.
