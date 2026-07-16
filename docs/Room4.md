# Room 4 — Gabinete de Luís

## Estado atual

O episódio “O Exame Impossível” está implementado em `room4.asc` e `GlobalScript.asc`. Background, personagem, itens de inventário e sprites existem no projeto. Este documento é a referência do puzzle e da configuração que deve ser validada no AGS Editor, não uma lista de elementos ainda por criar.

Gabriel encontra o Pai, Luís, a corrigir o último exame. Para o tirar do gabinete, precisa de recuperar um rascunho, localizar a página 47 da grelha, demonstrar uma suspensão e encontrar as chaves.

## Recursos

- Background: `Assets/gabinete_luis_room4.png` (`800x600`).
- Fonte em alta resolução: `Assets/gabinete_luis_room4_source.png`.
- Sprites de Luís: `Sprites/Luis/Walk/` e `Sprites/Luis/Talk/`.
- Itens: `Sprites/Room4/Items/Inventory/`.

Luís está configurado como `cLuis`, com normal view `9`, speech view `10` e Starting Room `4`. `room_Load()` volta a colocá-lo em `(320, 420)`, aplica scaling a 100% e atraso de fala 6.

## Estado do episódio

Flags globais:

- `gabinete_introducao_vista`.
- `gabinete_problema_explicado`.
- `gabinete_rascunho_encontrado`.
- `gabinete_grelha_encontrada`.
- `gabinete_resposta_resolvida`.
- `gabinete_chaves_mencionadas`.
- `gabinete_chaves_encontradas`.
- `gabinete_episodio_concluido`.

Estado local de visibilidade/recolha:

- `po_revelado`, `chaves_reveladas`.
- `regua_recolhida`, `fita_recolhida`, `frasco_recolhido`, `po_recolhido`, `copo_recolhido`.

`RecuperarEstadoDosObjetos()` reconstrói parte do estado físico a partir do inventário e das flags globais. Isto evita reaparecimentos em reentradas e saves, mas deve ser testado depois de cada combinação que consome itens.

## Objetos e itens

| Objeto | Item recebido | Handler de recolha |
|---|---|---|
| `oRegua` | `iRegua` | `oRegua_PickUp` |
| `oFitaCola` | `iFitaCola` | `oFitaCola_PickUp` |
| `oFrasco` | `iFrasco` | `oFrasco_PickUp` |
| `oCopoAgua` | `iCopoAgua` | `oCopoAgua_PickUp` |
| `oPoEfervescente` | `iPoEfervescente` | `oPoEfervescente_PickUp` |
| `oChaves` | `iChavesLuis` | `oChaves_PickUp` |

Objetos derivados:

- `iRegua` + `iFitaCola` → `iReguaComFita`.
- Usar `iReguaComFita` em `hArmarioBaixo` → `iRascunho`.
- Interagir com `hEstante` depois do rascunho → `iGrelhaCorrecao`.
- `iFrasco` + `iCopoAgua` → `iFrascoComAgua`.
- `iFrascoComAgua` + `iPoEfervescente` → `iSuspensao`.

O pó só é revelado dentro do armário depois de Gabriel encontrar a grelha.

## Walkthrough

1. Falar com Luís. Ele explica que o rascunho caiu para debaixo do armário.
2. Apanhar a régua e a fita-cola.
3. Combinar os dois itens para obter `iReguaComFita`.
4. Usar a régua com fita no armário baixo para pescar `iRascunho`.
5. Interagir com a estante para encontrar `iGrelhaCorrecao` (página 47).
6. Voltar ao armário e interagir para revelar o pó de demonstração.
7. Apanhar frasco, copo com água e pó.
8. Combinar frasco + água; depois frasco com água + pó para obter `iSuspensao`.
9. Usar `iSuspensao` em Luís. A resposta é identificada como “suspensão” e o exame fica corrigido.
10. Falar novamente com Luís para ele mencionar as chaves.
11. Interagir com `hPilhaExames` para revelar `oChaves`.
12. Apanhar as chaves e voltar a falar com Luís.

Quando o episódio termina, `iChavesLuis` é consumido, `gabinete_episodio_concluido` passa a `true` e Gabriel muda para a Room 6 em `(80, 520)`. Há também uma rota pela porta que move Luís para a Room 6; esta integração deve ser validada porque o estado `comPai` está duplicado noutros scripts.

## Hotspots

| Hotspot | Função |
|---|---|
| `hArmarioBaixo` | rascunho e revelação do pó |
| `hEstante` | página 47 da grelha |
| `hPilhaExames` | revelação das chaves |
| `hJanela` | comentário |
| `hDiplomas` | comentário |
| `hBancada` | comentário |
| `hPortaGabinete` | bloqueio/saída do episódio |

Eventos da sala:

- Before fade-in → `room_Load`.
- After fade-in → `room_AfterFadeIn`.
- Repeatedly execute → `room_RepExec` (atualmente sem atualização ativa).

## Validação no editor

- Confirmar handlers Look/Pick up dos seis objetos.
- Confirmar handlers Look/Interact/Use inventory dos hotspots relevantes.
- Confirmar posições e scaling aplicados: pó 50%, fita 50%, régua 80%, água 50%, frasco 60% e chaves 50%.
- Testar recolhas em ordens diferentes e tentativas antes de Luís explicar o problema.
- Guardar/carregar antes e depois de cada combinação.
- Confirmar que pó e chaves não aparecem antes do momento narrativo correto.
- Confirmar que Luís chega ao destino seguinte e não fica duplicado ou invisível.
