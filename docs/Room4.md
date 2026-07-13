# Room 4 - Gabinete do Luis

Este documento contem a configuracao que falta fazer no AGS Editor. O episodio e
`O Exame Impossivel`: Gabriel recupera o rascunho de um aluno, encontra a pagina
47 da grelha, demonstra uma suspensao e recupera as chaves do Pai.

## 0. Importar o background

No Room 4, importar como background principal:

`Assets/gabinete_luis_room4.png`

O ficheiro ja esta em RGB e mede exatamente `800x600`. A geracao original em
maior resolucao ficou em `Assets/gabinete_luis_room4_source.png`.

## 1. Importar os sprites do Luis

Criar uma pasta `Luis` no painel de sprites e importar os PNGs com alpha.
Todos os frames individuais medem `192x224`. O corpo foi normalizado para 190 px
e os pes estao alinhados a 8 px da margem inferior em todos os frames.

### ViewLuisWalk

Usar seis frames por loop, delay sugerido `5`:

| Loop | Direcao | Ficheiros, por ordem |
|---|---|---|
| 0 | baixo | `Sprites/Luis/Walk/down_0.png` a `down_5.png` |
| 1 | esquerda | `Sprites/Luis/Walk/left_0.png` a `left_5.png` |
| 2 | direita | `Sprites/Luis/Walk/right_0.png` a `right_5.png` |
| 3 | cima | `Sprites/Luis/Walk/up_0.png` a `up_5.png` |

### ViewLuisTalk

Usar seis frames por loop, delay sugerido `6`:

| Loop | Direcao | Ficheiros, por ordem |
|---|---|---|
| 0 | baixo | `Sprites/Luis/Talk/down_0.png` a `down_5.png` |
| 1 | esquerda | `Sprites/Luis/Talk/left_0.png` a `left_5.png` |
| 2 | direita | `Sprites/Luis/Talk/right_0.png` a `right_5.png` |
| 3 | cima | `Sprites/Luis/Talk/up_0.png` a `up_5.png` |

As folhas originais e as versoes transparentes completas ficaram em
`Sprites/Luis/Source/`. Servem para voltar a cortar ou criar outras animacoes.

## 2. Criar a personagem

Criar uma personagem com estas propriedades:

- Name: `Luis`
- Script name: `cLuis`
- Starting room: `4`
- X: `620`
- Y: `470`
- Normal view: `ViewLuisWalk`
- Speech view: `ViewLuisTalk`
- Speech color: uma cor diferente da de Gabriel
- Clickable: `True`
- Solid: `True`
- Movement speed: `5`
- Animation delay: `5`

Ligar os eventos globais:

| Evento | Funcao |
|---|---|
| Look at character | `cLuis_Look` |
| Interact character | `cLuis_Interact` |
| Talk to character | `cLuis_Talk` |
| Use inventory on character | `cLuis_UseInv` |

Esta separacao e intencional: a personagem fica reutilizavel e os seus eventos
continuam no `GlobalScript.asc`; os objetos do gabinete ficam em `room4.asc`.

## 3. Criar os itens de inventario

Criar os itens abaixo, sem marcar `Player starts with item`. Importar as imagens
de `Sprites/Room4/Items/Inventory/` e usar a mesma imagem no campo Image e Cursor.
Os PNGs finais medem `64x64` e usam pixel art VGA com transparencia dura, para
combinar com a pistola Nerf e o restante inventario retro do projeto. Importar
sem qualquer filtro de suavizacao ou redimensionamento interpolado.

| Script name | Description | PNG | Evento `Use inventory on this item` |
|---|---|---|---|
| `iFitaCola` | Fita-cola | `fita_cola.png` | `iFitaCola_UseInv` |
| `iRegua` | Regua | `regua.png` | `iRegua_UseInv` |
| `iReguaComFita` | Regua com fita-cola | `regua_com_fita.png` | - |
| `iRascunho` | Rascunho ilegivel | `rascunho.png` | - |
| `iGrelhaCorrecao` | Pagina 47 da grelha | `grelha_correcao.png` | - |
| `iFrasco` | Frasco vazio | `frasco_vazio.png` | `iFrasco_UseInv` |
| `iCopoAgua` | Copo com agua | `copo_agua.png` | `iCopoAgua_UseInv` |
| `iFrascoComAgua` | Frasco com agua | `frasco_com_agua.png` | `iFrascoComAgua_UseInv` |
| `iPoEfervescente` | Po para demonstracao | `po_efervescente.png` | `iPoEfervescente_UseInv` |
| `iSuspensao` | Suspensao | `suspensao.png` | - |
| `iChavesLuis` | Chaves do Luis | `chaves.png` | - |

Ligar tambem `Interact inventory item` nos itens abaixo:

| Item | Funcao |
|---|---|
| `iReguaComFita` | `iReguaComFita_Interact` |
| `iRascunho` | `iRascunho_Interact` |
| `iGrelhaCorrecao` | `iGrelhaCorrecao_Interact` |
| `iSuspensao` | `iSuspensao_Interact` |
| `iChavesLuis` | `iChavesLuis_Interact` |

## 4. Objetos do Room 4

Criar estes objetos. As coordenadas sao uma base para teste; devem ser afinadas
visualmente sobre o fundo do gabinete. Os objetos podem usar os mesmos PNGs do
inventario; o script trata da visibilidade e da recolha.

| Script name | Posicao sugerida | Sprite | Eventos |
|---|---:|---|---|
| `oRegua` | 275, 345 | `regua.png` | Look `oRegua_Look`; Pick up `oRegua_PickUp` |
| `oFitaCola` | 225, 350 | `fita_cola.png` | Look `oFitaCola_Look`; Pick up `oFitaCola_PickUp` |
| `oFrasco` | 65, 345 | `frasco_vazio.png` | Look `oFrasco_Look`; Pick up `oFrasco_PickUp` |
| `oPoEfervescente` | 130, 350 | `po_efervescente.png` | Look `oPoEfervescente_Look`; Pick up `oPoEfervescente_PickUp` |
| `oCopoAgua` | 190, 350 | `copo_agua.png` | Look `oCopoAgua_Look`; Pick up `oCopoAgua_PickUp` |
| `oChaves` | 675, 315 | `chaves.png` | Look `oChaves_Look`; Pick up `oChaves_PickUp` |

`oChaves` pode ficar inicialmente invisivel; `room_Load` e `room_RepExec`
sincronizam-no com a resolucao do exame.

## 5. Hotspots do Room 4

Desenhar as areas sobre os elementos equivalentes do fundo e usar estes nomes:

| Script name | Walk-to sugerido | Eventos |
|---|---:|---|
| `hArmarioBaixo` | 315, 410 | Look `hArmarioBaixo_Look`; Interact `hArmarioBaixo_Interact`; Use inventory `hArmarioBaixo_UseInv` |
| `hEstante` | 230, 420 | Look `hEstante_Look`; Interact `hEstante_Interact` |
| `hPilhaExames` | 590, 410 | Look `hPilhaExames_Look`; Interact `hPilhaExames_Interact` |
| `hJanela` | 430, 420 | Look `hJanela_Look` |
| `hDiplomas` | 560, 420 | Look `hDiplomas_Look` |
| `hBancada` | 270, 455 | Look `hBancada_Look` |
| `hPortaGabinete` | 720, 490 | Look `hPortaGabinete_Look`; Interact `hPortaGabinete_Interact` |

Ligar os eventos da sala:

| Evento da sala | Funcao |
|---|---|
| Enters room before fade-in | `room_Load` |
| Enters room after fade-in | `room_AfterFadeIn` |
| Repeatedly execute | `room_RepExec` |

Confirmar que existe pelo menos uma walkable area ligando a entrada, o Luis, o
armario, a estante e a bancada. O gabinete usa a resolucao normal do jogo,
`800x600`.

Para este background, uma primeira walkable area pode cobrir aproximadamente o
poligono `(245,365)`, `(450,345)`, `(705,365)`, `(770,560)`, `(225,560)`. Excluir
as frentes da bancada e da secretaria ao desenhar a mascara final.

## 6. Ordem de teste

1. Falar com `cLuis`.
2. Apanhar `oRegua` e `oFitaCola`.
3. Combinar regua + fita-cola.
4. Usar `iReguaComFita` em `hArmarioBaixo`.
5. Interagir com `hEstante` para obter a pagina 47.
6. Voltar a interagir com `hArmarioBaixo` para abrir o armario e revelar o po.
7. Apanhar frasco, copo de agua e po.
8. Combinar frasco + agua; depois frasco com agua + po.
9. Usar `iSuspensao` em `cLuis`.
10. Falar com `cLuis` para ele mencionar as chaves.
11. Interagir com `hPilhaExames` para revelar as chaves e depois apanhar `oChaves`.
12. Falar com `cLuis` ou usar `hPortaGabinete`; Gabriel e Luis seguem para o Room 5.

As combinacoes funcionam nos dois sentidos. As tentativas fora de ordem recebem
dialogos proprios e nao consomem itens.

## 7. Validacao

Depois de criar todos os nomes acima, guardar o projeto e compilar. O script nao
compila antes disso porque o AGS gera os simbolos `cLuis`, `oRegua`,
`iReguaComFita`, etc. a partir dos elementos criados no editor. Rever
`warnings.log` depois da primeira compilacao.
