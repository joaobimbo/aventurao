# Walkthrough e puzzles

Este documento descreve o que ja existe na primeira sala e como os puzzles estao ligados.

## Estado inicial conhecido

Gabriel comeca na sala 1, o quarto.

Itens que o jogador comeca a ter, segundo `Game.agf`:

- `iOboe`: Oboe.
- `iKey`: Key.

`iPistolL` nao e item inicial; o jogador precisa encontrar a pistola descarregada e os Nerfs para a carregar.

## Objetos e hotspots principais

- `hDesenho`: desenho na parede. Pode ser olhado, usado e usado com inventario.
- `hLuzCabec`: luz no teto.
- `hPorta`: porta. Tem olhar, usar e pegar.
- `hBed`: cama.
- `hSofa` / `sofa`: sofa. Esconde Nerfs quando se interage.
- `oCup`: caneca. Ao olhar, revela a palheta.
- `oReed`: palheta de oboe.
- `oNerfs`: dardos Nerf escondidos no sofa.
- `oObject1`: pistola Nerf descarregada.
- `oPartitura`: partitura inicialmente alta/inacessivel.
- `oNerfFly`: objeto visual usado durante o disparo.

## Puzzle da palheta e oboe

1. Olhar para a caneca (`oCup_Look`).
2. O texto diz que ha uma palheta de oboe dentro.
3. `oReed.Visible = true`, revelando a palheta.
4. Pegar na palheta (`oReed_PickUp` ou `oCup_PickUp` se a palheta estiver visivel).
5. Combinar `iReed` com `iOboe`.
6. O script `LoadOboe()` remove `iReed` e `iOboe` e adiciona `iOboeR`.

Estado resultante: Gabriel fica com `Oboe com palheta`.

## Puzzle dos Nerfs e pistola

1. Interagir com o sofa (`sofa_Interact`).
2. Gabriel diz que ha qualquer coisa enfiada no sofa.
3. `oNerfs.Visible = true`, revelando os Nerfs.
4. Pegar nos Nerfs (`oNerfs_PickUp`).
5. Pegar na pistola descarregada (`oObject1_PickUp`).
6. Combinar `iPistol` com `iNerfs`.
7. O script `LoadPistol()` remove `iPistol` e `iNerfs` e adiciona `iPistolL`.

Estado resultante: Gabriel fica com `Pistola Nerf (carregada)`.

## Puzzle da partitura

Objetivo atual: fazer cair a partitura para a conseguir apanhar.

1. Ter `iPistolL`.
2. Usar `iPistolL` no desenho (`hDesenho_UseInv`).
3. Gabriel anda ate `hTapete`.
4. Gabriel diz "Aqui vai disto!".
5. A view muda para `NERFSHOOT`.
6. O objeto `oNerfFly` aparece e move-se.
7. `oPartitura` move-se para baixo.
8. A propriedade customizada `Pickable` de `oPartitura` passa para `true`.
9. Depois disso, pegar na partitura adiciona `iPartitura` ao inventario.

Se o jogador tentar apanhar a partitura antes de estar `Pickable`, Gabriel diz que esta muito alto e nao chega la.

## Puzzle de praticar oboe

Objetivo atual: cumprir a ordem da mae antes de Gabriel poder ir dormir.

Pre-condicoes:

- Gabriel tem `iOboeR` depois de combinar `iOboe` com `iReed`.
- Gabriel tem `iPartitura` depois de fazer cair e apanhar a partitura.

Fluxo:

1. Usar `iPartitura` no tripe (`hTripe` ou objeto `oObject0`).
2. O script `PutPartituraOnTripe()` remove `iPartitura` do inventario.
3. O estado `partitura_on_tripe` passa para `true`.
4. `oObject0.Graphic` passa para o sprite 80, mostrando o tripe com a folha.
5. Gabriel ainda nao toca neste momento.
6. Usar `iOboeR` no tripe/partitura preparada.
7. O script `PracticeOboe(true)` toca a animacao `OboePractice` na primeira vez.
8. `gabriel_practiced_oboe` passa para `true`.
9. A partir desse estado, a cama deixa Gabriel ir para a Room 2.

Depois da primeira pratica, usar novamente `iOboeR` no tripe chama `PracticeOboe(false)`: Gabriel volta a tocar a animacao e comenta, mas a historia nao avanca nem altera novo estado.

## Transicao para Room 2

Depois de `gabriel_practiced_oboe == true`, interagir com a cama chama `player.ChangeRoom(2, 400, 300)`.

Isto faz Gabriel entrar na Room 2 perto do centro da sala.

## Dialogo com Roger

Roger (`cRoger`) esta na sala 1 e tem dialogo `dDialog1`.

O dialogo parece temporario:

- `Cucu`
- `oioi`
- `Que tal?`

O script liga `cRoger_Talk` a `dDialog1.Start()`. Roger tambem tem `UseInv`, que delega para a interacao do inventario ativo.

## Coisas a rever no puzzle

- Confirmar no AGS Editor se a grelha de inventario `72x80` continua confortavel quando houver mais itens.
- Testar visualmente se o tripe com folha fica bem alinhado quando `oObject0.Graphic = 80`.
- Decidir para que serve `iKey`.

