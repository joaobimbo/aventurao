# Room 3 — Porta Férrea e os praxistas

## Estado atual

O puzzle está implementado em `room3.asc`, `GlobalScript.asc` e nos dialogs `dPraxistasAntes` e `dPraxistasDobra` de `Game.agf`. Os assets estão em `Assets/porta_ferrea_*` e `Sprites/Room3/`.

Gabriel quer entrar na Universidade para procurar o Pai. Cinco praxistas bloqueiam a Porta Férrea e recusam deixá-lo passar por o considerarem caloiro.

## Estados

`praxe_state` é global:

| Valor | Significado |
|---:|---|
| `0` | Gabriel ainda não apanhou o saco limpo |
| `1` | `iSacoLixo` está no inventário |
| `2` | Gabriel vestiu o saco e usa `VIEWGABRIELSACO` |
| `3` | praxistas afastados; Porta Férrea desbloqueada |

Estado local da sala controla os cartazes, copos, caixote, introdução e recolha do lixo.

## Puzzle físico

1. Apanhar os cartazes da Queima no hotspot `hCartazes`, recebendo `iFolhetos`.
2. Apanhar `oCopos`, recebendo `iCopos`.
3. Usar ambos no caixote (`hLixo`, `oLixo` ou `oCaixote`).
4. Ao entrar o segundo item, `ChamarFuncionaria()` traz `cFuncionaria`, executa a animação de troca do saco e revela `oSacoLimpo`.
5. Apanhar o saco para obter `iSacoLixo` e mudar `praxe_state` para `1`.
6. Usar o saco em Gabriel ou interagir com o item. `VestirSacoComoVeterano()` consome o item, muda a view e define `praxe_state = 2`.

Os objetos `oLixo` e `oCaixote` estão sobrepostos para representar caixote vazio/cheio. Os wrappers de handler garantem que hotspot e objetos chamam a mesma lógica.

## Diálogo antes do disfarce

Sem o saco vestido, falar ou interagir com os praxistas abre `dPraxistasAntes`. O grupo cita o “artigo 8-A” e bloqueia a passagem. As respostas são opcionais e não avançam o estado; servem para exploração e humor.

Tentar atravessar `hPortaFerrea` antes de resolver o puzzle faz o grupo comentar e Gabriel recuar.

## Diálogo de autoridade inventada

Com `praxe_state == 2`, os praxistas tratam Gabriel por “Doutor”. A sequência correta é:

1. “...quem vos ensinou essa dobra?”
2. “Vocês ainda usam essa dobra?”
3. “Código da Praxe, artigo 47-B: dobra obsoleta. Reaprendizagem imediata.”
4. “Sanção 3-C: reaprendizagem coletiva fora do perímetro. Imediatamente.”

As outras escolhas terminam o diálogo sem bloquear nova tentativa. A escolha final correta envia `run-script 20`, que coloca `praxistas_dialog_result = 20`. `room_RepExec()` move o grupo para fora do ecrã, torna-o invisível/não clicável e define `praxe_state = 3`.

Com o puzzle resolvido, interagir com a Porta Férrea muda para a Room 4.

## Personagens e recursos

- `cPraxistas`: Room 3, normal view `6`, speech view `8`, scaling aplicado a 80%.
- `cFuncionaria`: começa fora das salas e é colocada temporariamente na Room 3.
- Gabriel com saco: `Sprites/Room3/GabrielSaco/`.
- Caixote: `Sprites/Room3/Caixote/`.
- Funcionária e troca do saco: `Sprites/Room3/Funcionaria/`.
- Saída dos praxistas: `Sprites/Room3/PraxistasSaida/`.

## Intenção de escrita

- O saco nunca é comentado pelos praxistas; eles veem apenas a confiança de Gabriel.
- Gabriel não explica a dobra inventada.
- O grupo prefere aceitar uma regra absurda a admitir ignorância.
- A escalada de artigo e sanção reforça a sátira burocrática sem alterar a solução física.

## Validação no editor

- Confirmar que cartazes e copos podem ser recolhidos uma única vez.
- Confirmar que qualquer ordem dos dois itens enche o caixote.
- Confirmar animação da funcionária e visibilidade de `oSacoLimpo`.
- Confirmar os quatro loops de `VIEWGABRIELSACO`.
- Confirmar que hotspot e objetos do caixote não criam alvos concorrentes na verb coin.
- Testar escolhas erradas e repetição do diálogo dos praxistas.
- Confirmar que o grupo deixa de ser clicável e que a Room 4 abre apenas no estado `3`.
- Testar save/load nos estados `1`, `2` e `3`.
