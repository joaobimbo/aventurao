# Afazer Joao

Tarefas simples de fazer no AGS Editor, mas arriscadas ou pouco praticas para editar diretamente em ficheiros binarios.

## Room 1

- Abrir `room1.crm` no AGS Editor e aumentar a mascara/hotspot da partitura na parede (`hDesenho`) para ser mais facil acertar com o rato.
- Confirmar no editor o nome visivel do hotspot da partitura. O ficheiro foi ajustado para `Partitura Parede`, mas o ideal e validar/renomear diretamente no painel de propriedades.
- Corrigir o warning persistente do sofa: o AGS ainda diz que o evento `sofa_PickUp` nao foi encontrado na Room 1. Confirmar no editor se o evento Pick up do sofa aponta para o script/module certo, ou remover esse evento se nao for necessario.
- Testar em jogo que usar a partitura no tripe funciona tanto clicando no hotspot `hTripe` como no objeto `oObject0`.
- Testar em jogo que Gabriel so comeca a tocar quando se usa o oboe com palheta (`iOboeR`) na partitura/tripe ja preparado.
- Testar em jogo que usar novamente `iOboeR` no tripe depois da primeira pratica repete a animacao sem mudar a historia.

## Room 2

- Confirmar visualmente em jogo que, depois de praticar oboe, usar a cama faz transicao para a room 2 e Gabriel aparece perto do centro (`400,300`).
- Ajustar walkable areas/hotspots da room 2 se, ao testar, Gabriel aparecer fora da zona certa ou sem area caminhavel.

## Sprites e GUI

- No Sprite Manager, confirmar que o sprite da palheta (`slot 28`) foi reimportado de `Sprites/Characters/palheta_inventory.png`.
- No Sprite Manager, confirmar/reimportar os sprites dos botoes de menu (`slots 2160-2163`) a partir dos PNGs em `Sprites/Defaults/UI/`. Os ficheiros medium continuam `71x19`; os botoes large agora estao em `177x56`, para bater com os controlos grandes do menu.
- Ver visualmente os botoes dos menus (`gPanel`, `gSaveGame`, `gRestoreGame`, `gRestart`, `gExitGame`) e ajustar posicoes/tamanhos no editor se algum texto ficar mal alinhado.
- Confirmar visualmente a posicao/tamanho do tripe com folha depois de usar a partitura nele.
- Corrigir/reimportar os sprites do tripe/partitura se continuarem desalinhados: `Sprites/Defaults/tripe.bmp`, `Sprites/Defaults/tripe2.bmp` e sprite slot 80.
