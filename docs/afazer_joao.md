# A fazer no AGS Editor

Pendências que exigem configuração visual, compilação ou decisão de design no editor. A lógica principal das Rooms 1, 3, 4, 6 e 7 já está escrita.

## Integração geral

- [ ] Alterar `cGabriel.StartingRoom` de `7` para a sala inicial definitiva (provavelmente Room 1) quando terminar o teste isolado da pastelaria.
- [ ] Decidir se a Room 5/Estação entra no percurso. Atualmente existe no projeto e tem background, mas não tem handlers.
- [ ] Escolher um único regresso depois de obter o bolo e alinhar `room6.asc` e `room7.asc` com essa decisão.
- [ ] Resolver o estado `comPai`, atualmente duplicado em scripts globais e de sala.
- [ ] Compilar, rever `warnings.log` e corrigir o movimento bloqueante da Room 1 no evento Before Fade-in.

## Room 1 — quarto

- [ ] Mover o `player.Walk(..., eBlock, ...)` de `room_Load()` para After Fade-in ou torná-lo não bloqueante.
- [ ] Testar o alinhamento do tripé com `oTripe.Graphic = 384`.
- [ ] Confirmar que `hSofa_PickUp`, `sofa_Interact`, `oCup_PickUp` e `oReed_PickUp` estão ligados aos eventos pretendidos, sem duas formas acidentais de recolher o mesmo item.
- [ ] Jogar o puzzle sem itens injetados: palheta + oboé, Nerfs + pistola, disparo, partitura, tripé e cama.

## Rooms 2 e 10 — casa/ligação

- [ ] Confirmar visualmente a transição Room 2 → Room 10 → Room 3.
- [ ] Confirmar que o regresso `hParaCasa_Interact` mantém Luís e o estado da missão corretos.
- [ ] Dar descrições às Rooms 1–5 e 10 no painel Rooms, como já existe para Rooms 6 e 7.

## Room 3 — Porta Férrea

- [ ] Testar os alvos sobrepostos `hLixo`, `oLixo` e `oCaixote` com a verb coin.
- [ ] Confirmar a animação da funcionária no loop 3 e a troca visual caixote vazio/cheio/saco limpo.
- [ ] Confirmar a view `VIEWGABRIELSACO` em todas as direções.
- [ ] Testar a sequência correta do diálogo dos praxistas: “quem vos ensinou essa dobra?” → “Vocês ainda usam essa dobra?” → artigo 47-B → sanção 3-C.
- [ ] Confirmar que os praxistas saem do ecrã e deixam de ser clicáveis antes de abrir a Room 4.

## Room 4 — gabinete de Luís

- [ ] Confirmar posições, scaling e baselines de todos os objetos (`oRegua`, `oFitaCola`, `oFrasco`, `oCopoAgua`, `oPoEfervescente`, `oChaves`).
- [ ] Testar reentrada e save/load depois de consumir cada combinação, garantindo que objetos não reaparecem.
- [ ] Confirmar que a pilha de exames só revela as chaves depois de Luís as mencionar.
- [ ] Confirmar que a saída coloca Gabriel e Luís no destino decidido.

## Room 5 — Estação Fernando Namora

- [ ] Decidir se a sala faz parte desta versão.
- [ ] Se sim, desenhar walkable areas e hotspots de destino sobre `Assets/estacao_fernando_namora_room5.png`.
- [ ] Implementar `room5.asc` e ligar casa, Universidade e pastelaria sem depender da Room 10 provisória.
- [ ] Se não, remover a Room 5 do percurso documentado sem apagar os assets-fonte.

## Room 6 — entrada do Moinho Velho

- [ ] Confirmar que o banco, avental, caixa de chapéus, porta da cozinha e saída têm hotspots bem alinhados.
- [ ] Confirmar a view da empregada e o scaling a 90%.
- [ ] Confirmar visualmente a mudança de Gabriel para o disfarce de ajudante ao entrar na Room 7.
- [ ] Testar tentativas de entrar sem disfarce, com apenas uma peça e com o disfarce completo.

## Room 7 — cozinha

- [ ] Confirmar que `oCartazGrego`, `oAmpulheta4`, `oAmpulheta7`, `oLivroEncomendas` e `oBoloA`–`oBoloE` usam os sprites importados em `Sprites/Room6/Objects/`.
- [ ] Rever hotspots e objetos duplicados. O script ainda mantém wrappers de hotspot para bolos/ampulhetas e handlers de objeto para parte desses alvos.
- [ ] Ligar/confirmar o evento Look do livro e os eventos Look/Interact dos cinco bolos.
- [ ] Testar a solução das ampulhetas e também retirada precoce, espera sem ampulheta ativa e cobertura queimada.
- [ ] Testar uma atribuição errada completa dos cinco bolos e depois a correta: A=Mariana, B=Tiago, C=Rita, D=Gabriel, E=Patrícia.
- [ ] Confirmar que `iBirthdayCake` aparece uma única vez e que o regresso restaura a view normal de Gabriel.

## Encerramento

- [ ] Fazer um teste integral desde um novo jogo.
- [ ] Fazer um teste integral a partir do save mais antigo que se pretenda suportar.
- [ ] Confirmar que apenas scripts/docs/assets pretendidos mudaram; não regenerar `Compiled/` sem necessidade.
