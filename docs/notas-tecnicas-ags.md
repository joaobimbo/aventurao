# Notas tecnicas AGS

## Projeto

- Motor/editor: Adventure Game Studio.
- Editor usado no ficheiro: AGS 3.6.2.18.
- Ficheiro principal: `Game.agf`.
- Nome do jogo: `Aventurao`.
- Executavel/dados: `aventurao`.
- Build target atual: Windows.
- Resolucao: 800x600.
- FPS: 40.
- Codificacao de texto: UTF-8.
- Speech style: LucasArts.
- Debug mode: ativo.

## Ficheiros principais

- `Game.agf`: configuracao geral, personagens, inventario, views, GUIs e referencias.
- `GlobalScript.asc`: arranque, GUIs, input, verb coin, respostas default, combinacoes globais de inventario.
- `GlobalScript.ash`: header global, atualmente quase vazio.
- `room1.asc`: logica da primeira sala.
- `room1.crm`: dados binarios da sala 1.
- `VerbCoin.asc` e `VerbCoin.ash`: modulo de interface da verb coin.
- `Assets/quarto_bg.jpg`: imagem de fundo do quarto.
- `Assets/adventure_theme.mid`: musica.
- `Sprites/`: sprites exportados/guardados por categoria.

## Verb coin

O modulo `VerbCoin` e inicializado em `game_start()`:

- GUI: `gVerbCoin`.
- Inventario: `gInventory`.
- Label de acao: `lblAction`.
- Botao norte: `btnLook`, modo `eModeLookat`, texto `Olhar`.
- Botao este: `btnTalk`, modo `eModeTalkto`, texto `Falar`.
- Botao sul: `btnInteract`, modo `eModeInteract`, texto `Usar`.
- Botao oeste: `btnPickup`, modo `eModePickup`, texto `Pegar`.
- Cursor default: `eModeInteract`.

`ButtonAutoDisable` e `ShowOnlyIfInteractionAvailable` estao comentados/desativados. Isto significa que a verb coin pode aparecer mesmo quando uma interacao especifica nao esta implementada, caindo depois em `unhandled_event`.

## Input

Teclas importantes:

- `Escape`: fecha verb coin, inventario, painel, save/load, restart ou exit; se nada estiver aberto, abre o painel.
- `Ctrl+Q`: abre confirmacao de sair.
- `F5`: save.
- `F7`: load.
- `F9`: restart.
- `F12`: screenshot.
- `Ctrl+S`, `Ctrl+V`, `Ctrl+A`, `Ctrl+X`: comandos de debug AGS.

Mouse:

- Clique esquerdo no mundo: abre verb coin ou anda se nao houver alvo.
- Clique direito: fecha/cancela ou abre inventario.
- Clique esquerdo no inventario: seleciona/combina.
- Clique direito no inventario: examina/cancela.

## Respostas default

`GlobalScript.asc` tem um `unhandled_event` personalizado para:

- hotspots,
- objetos,
- personagens,
- itens de inventario.

Isto e importante para manter o tom do jogo: mesmo quando ainda nao ha puzzle implementado, Gabriel responde com humor e personalidade.

## Propriedades customizadas

Existe uma propriedade customizada:

- `Pickable`, booleana, aplicada a objetos.

Uso atual:

- `oPartitura` so pode ser apanhada depois de `Pickable` passar para `true`.

## Views importantes

- `VIEW1`: view default inicial.
- `View_wg`: view normal de Gabriel usada depois da animacao de disparo.
- `nerfshoot`: animacao de Gabriel a disparar Nerf.

No script, ha referencias em maiusculas geradas pelo AGS:

- `NERFSHOOT`
- `VIEW_WG`

## Avisos atuais

`warnings.log` contem:

```text
Game : (room:1) WARNING: event script function 'sofa_MouseMove' not found (Room 1)
```

Existe `hSofa_MouseMove` em `room1.asc`, mas o evento configurado parece procurar `sofa_MouseMove`. Solucao provavel: alinhar o nome do evento no AGS Editor ou criar uma funcao `sofa_MouseMove(Hotspot *theHotspot)`.

## Notas de codificacao

Alguns textos no `room1.asc` aparecem com mojibake em palavras acentuadas. O projeto declara UTF-8, mas convem confirmar no AGS Editor se os scripts estao a ser guardados e lidos com a mesma codificacao.

Para evitar problemas, muitos textos novos atuais foram escritos sem acentos.

## Ficheiros gerados

Pastas/ficheiros como `Compiled/`, `_Debug/`, `warnings.log`, `Game.agf.user` e `room1.crm.user` sao derivados do editor ou da maquina local. O que normalmente interessa preservar para continuar desenvolvimento e:

- `Game.agf`
- `room1.crm`
- scripts `.asc` e `.ash`
- sprites/assets customizados
- `acsprset.spr`
- `sprindex.dat`
