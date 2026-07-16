# Próximos passos

O conteúdo jogável está praticamente implementado até à Room 7. A prioridade já não é desenhar novos puzzles, mas integrar o percurso, corrigir inconsistências e fazer validação completa no AGS Editor.

## Prioridade alta

- [ ] Definir a sala inicial de produção. `cGabriel.StartingRoom` está em `7`; para jogar a história desde o início deverá voltar à Room 1.
- [ ] Integrar ou adiar explicitamente a Room 5. O background da Estação Fernando Namora existe, mas `room5.asc` está vazio e a Room 4 salta diretamente para a Room 6.
- [ ] Unificar o fim da pastelaria: a porta da Room 7 regressa à Room 2, enquanto a saída da Room 6 regressa à Room 1.
- [ ] Corrigir o warning de `Wait()` no evento Before Fade-in da Room 1, causado pelo movimento bloqueante em `room_Load()`.
- [ ] Remover ou resolver a duplicação de `comPai` entre `GlobalScript.asc`, `room4.asc` e `room10.asc`.
- [ ] Compilar e jogar o percurso completo com inventário normal, sem atalhos de debug.

## Validação por episódio

- [ ] Room 1: caneca/palheta, sofá/Nerfs, pistola, partitura, tripé, prática e cama.
- [ ] Rooms 2/10: missão da mãe e ida/regresso entre casa e Universidade.
- [ ] Room 3: cartazes + copos, troca do saco, vestir o saco, diálogo correto e saída dos praxistas.
- [ ] Room 4: régua com fita, rascunho, página 47, suspensão, chaves e saída com Luís.
- [ ] Room 6: banco, avental, chapéu, diálogo da empregada e entrada na cozinha.
- [ ] Room 7: cartaz grego, solução de nove minutos, atribuição dos cinco bolos e receção de `iBirthdayCake`.
- [ ] Guardar/carregar no meio das Rooms 3, 4 e 7 e confirmar que visibilidade, inventário e diálogos não reiniciam indevidamente.

## Polimento

- [ ] Confirmar baselines, scaling e áreas caminháveis nas Rooms 3, 4, 6 e 7.
- [ ] Confirmar que objetos visuais e hotspots sobrepostos na Room 7 não competem pelo clique.
- [ ] Rever a grelha de inventário `72x80` com o maior número possível de itens.
- [ ] Dar função a `iKey` ou removê-la dos itens iniciais.
- [ ] Rever o placeholder de Roger e decidir se a personagem continua no jogo.
- [ ] Normalizar acentos apenas depois de testar UTF-8 no AGS Editor.
- [ ] Separar futuros commits de scripts, assets e builds compilados.

## Critério de conclusão desta fase

A fase “até à Room 7” fica fechada quando um novo jogo percorre sem bloqueios `1 → 2 → 10 → 3 → 4 → 6 → 7`, entrega o bolo, regressa ao destino narrativo escolhido e compila sem warnings novos.
