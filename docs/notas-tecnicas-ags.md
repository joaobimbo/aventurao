# Notas técnicas AGS

## Projeto

- Motor/editor: Adventure Game Studio 3.6.2.18.
- Ficheiro principal: `Game.agf`.
- Nome e executável: `Aventurao` / `aventurao`.
- Target: Windows.
- Resolução: `800x600`.
- FPS: `40`.
- Codificação declarada: UTF-8.
- Speech style: LucasArts.
- Debug mode: ativo.

## Salas e scripts

| Room | Estado no repositório | Script |
|---:|---|---|
| 1 | Quarto; puzzle jogável do oboé | `room1.asc` |
| 2 | Casa/transição narrativa para a Universidade | `room2.asc` |
| 3 | Porta Férrea; lixo, saco e praxistas | `room3.asc` |
| 4 | Gabinete de Luís; “O Exame Impossível” | `room4.asc` |
| 5 | Estação Fernando Namora; background criado, sem lógica | `room5.asc` |
| 6 | Entrada do Moinho Velho; disfarce de ajudante | `room6.asc` |
| 7 | Cozinha; cartaz, ampulhetas e bolos | `room7.asc` |
| 10 | Hub provisório entre casa e Universidade | `room10.asc` |

O fluxo de scripts atual é `1 → 2 → 10 → 3 → 4 → 6 → 7`. A Room 5 ainda não está integrada. A saída da Room 7 regressa à Room 2; a saída da Room 6, depois de concluir a pastelaria, regressa à Room 1.

## Ficheiros principais

- `GlobalScript.asc`: estado global, interface, input, respostas default, combinações de inventário e lógica partilhada das Rooms 3, 4 e 7.
- `GlobalScript.ash`: imports dos estados e helpers globais.
- `VerbCoin.asc` / `VerbCoin.ash`: implementação da verb coin.
- `roomN.asc`: lógica textual de cada sala.
- `roomN.crm`: configuração binária da sala no editor; não editar manualmente.
- `Game.agf`: personagens, inventário, dialogs, views, GUIs, sprites e lista de salas.
- `Assets/`: backgrounds e fontes visuais.
- `Sprites/`: imagens importadas/organizadas.

## Personagens configuradas

| Script name | Uso atual |
|---|---|
| `cGabriel` | jogador; `StartingRoom=7` no estado atual de testes |
| `cRoger` | personagem provisória, fora de sala (`-1`) |
| `cPraxistas` | grupo da Room 3 |
| `cFuncionaria` | animação de troca do saco na Room 3 |
| `cVania` | mãe, Room 2 |
| `cLuis` | Pai, Room 4; deslocado por script quando necessário |
| `cEmpregadaPastelaria` | entrada da pastelaria, Room 6 |
| `cPasteleiro` | cozinha, colocado na Room 7 por script |

## Inventário

Itens iniciais segundo `Game.agf`:

- `iOboe`.
- `iKey`.

Itens de puzzle configurados:

- Room 1: `iNerfs`, `iPistol`, `iPistolL`, `iReed`, `iOboeR`, `iPartitura`.
- Room 3: `iFolhetos`, `iCopos`, `iSacoLixo`.
- Room 4: `iFitaCola`, `iRegua`, `iReguaComFita`, `iRascunho`, `iGrelhaCorrecao`, `iFrasco`, `iCopoAgua`, `iFrascoComAgua`, `iPoEfervescente`, `iSuspensao`, `iChavesLuis`.
- Room 7: `iBirthdayCake`.

## Verb coin e input

`game_start()` configura:

- GUI `gVerbCoin` e inventário `gInventory`.
- Label `lblAction`.
- `btnLook` → `eModeLookat` → “Olhar”.
- `btnTalk` → `eModeTalkto` → “Falar”.
- `btnInteract` → `eModeInteract` → “Usar”.
- `btnPickup` → `eModePickup` → “Pegar”.
- Cursor default `eModeInteract`.

`ButtonAutoDisable` e `ShowOnlyIfInteractionAvailable` continuam desativados. Assim, uma opção sem handler pode aparecer e cair em `unhandled_event`, que tem respostas humorísticas para hotspots, objetos, personagens e inventário.

Teclas principais:

- `Escape`: fechar/cancelar interface ou abrir painel.
- `Ctrl+Q`: sair.
- `F5`: guardar.
- `F7`: carregar.
- `F9`: reiniciar.
- `F12`: screenshot.
- Atalhos de debug AGS permanecem ativos em debug mode.

## Estado persistente importante

### Global

- Room 1: `gabriel_practiced_oboe`.
- Room 3: `praxe_state` (`0` sem saco, `1` saco no inventário, `2` saco vestido, `3` praxistas afastados) e `praxistas_dialog_result`.
- Room 4: flags `gabinete_*` para introdução, rascunho, grelha, resposta, chaves e conclusão.
- Pastelaria: `enteredKitchen`, `cartazGregoResolvido`, `ampulhetasResolvidas`, `boloIdentificado`, `cakePuzzleSolved`, `pastelariaConcluida` e `cakeInOven`.

### Local de sala

- Room 1: `partitura_on_tripe`.
- Room 3: recolha e colocação de cartazes/copos, estado do caixote e da funcionária.
- Room 4: visibilidade/recolha dos objetos físicos.
- Room 6: introdução, posição do banco, avental, chapéu e autorização da empregada.
- Room 7: introduções da cozinha e das ampulhetas.

## Views e recursos relevantes

- Gabriel normal: view `2` / `VIEW_WG` conforme o contexto.
- Disparo Nerf: `NERFSHOOT`.
- Prática de oboé: view `4`.
- Gabriel com saco: `VIEWGABRIELSACO`.
- Gabriel ajudante de pastelaria: view `14`.
- Luís: normal view `9`, speech view `10`.
- Empregada do Moinho Velho: view `11`.
- Pasteleiro: normal view `12`, speech view `13`.

Os backgrounds das Rooms 3–7 existem em `Assets/`. Os objetos e personagens do Moinho Velho estão em `Sprites/Room6/` e já aparecem referenciados no `Game.agf`.

## Propriedade customizada

`Pickable` é uma propriedade booleana de objetos. Na Room 1, `oPartitura` só pode ser apanhada depois de o disparo Nerf alterar esta propriedade para `true`.

## Avisos e riscos conhecidos

- O `warnings.log` atual contém: `Wait() was used in "Before Fadein" event` em `room1.asc:340`. A causa é o `player.Walk(..., eBlock, ...)` dentro de `room_Load()`; deve ser movido para `room_AfterFadeIn()` ou tornado não bloqueante.
- `room10.asc` declara um `bool comPai` local com o mesmo nome de uma flag global. Esta duplicação pode tornar o comportamento do Pai inconsistente.
- Existem duas rotas de regresso após a pastelaria (Room 7 → Room 2 e Room 6 → Room 1) que precisam de decisão narrativa.
- Alguns textos usam ASCII e outros têm acentos. Confirmar sempre o resultado dentro do editor antes de normalizar encoding.

## Validação

Quando o AGS Editor estiver disponível:

1. Abrir `Game.agf`.
2. Compilar e testar.
3. Rever `warnings.log`.
4. Testar um jogo novo desde a Room 1 e um arranque de debug na Room 7.
5. Confirmar persistência com save/load durante os puzzles das Rooms 3, 4 e 7.

Sem AGS, fazer revisão manual dos handlers, procurar funções removidas/renomeadas e confirmar com `git diff` que nenhum binário foi alterado.
