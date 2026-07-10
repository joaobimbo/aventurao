# Afazer Joao

Tarefas simples de fazer no AGS Editor, mas arriscadas ou pouco praticas para editar diretamente em ficheiros binarios.

## Room 1

- Abrir `room1.crm` no AGS Editor e aumentar a mascara/hotspot da partitura na parede (`hDesenho`) para ser mais facil acertar com o rato.
- Confirmar no editor o nome visivel do hotspot da partitura. O ficheiro foi ajustado para `Partitura Parede`, mas o ideal e validar/renomear diretamente no painel de propriedades.
- Confirmar no editor que os eventos do sofa apontam para funcoes existentes (`sofa_Interact`, `sofa_MouseMove` ou os nomes `hSofa_*` que o editor estiver a usar).

## Sprites e GUI

- No Sprite Manager, confirmar que o sprite da palheta (`slot 28`) foi reimportado de `Sprites/Characters/palheta_inventory.png`.
- No Sprite Manager, confirmar/reimportar os sprites dos botoes de menu (`slots 2160-2163`) a partir dos PNGs em `Sprites/Defaults/UI/`. Os ficheiros devem ter o tamanho logico que o AGS espera: `71x19` para medium e `105x19` para large.
- Ver visualmente os botoes dos menus (`gPanel`, `gSaveGame`, `gRestoreGame`, `gRestart`, `gExitGame`) e ajustar posicoes/tamanhos no editor se algum texto ficar mal alinhado.
