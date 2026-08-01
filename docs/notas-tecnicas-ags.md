# Notas técnicas AGS

## Projeto

- Adventure Game Studio 3.6.2.18.
- Projeto principal: `Game.agf`.
- Nome/executável: `Aventurao` / `aventurao`.
- Targets: Windows, Linux e Web.
- Resolução: `800x600`; 40 FPS; speech style LucasArts.
- Codificação declarada: UTF-8.
- Versão atual: `1.0.0.0`.
- Debug mode: ativo; desativar para release.

## Salas

| Room | Conteúdo | Estado |
|---:|---|---|
| 1 | Quarto e puzzle do oboé | Jogável |
| 2 | Casa e missão da mãe | Jogável |
| 3 | Porta Férrea, lixo e praxistas | Jogável |
| 4 | Gabinete de Luís | Jogável |
| 5 | Estação Fernando Namora | Sem lógica; fora do percurso |
| 6 | Entrada do Moinho Velho | Jogável |
| 7 | Cozinha, ampulhetas e bolos | Jogável; final ainda mal ligado |
| 10 | Ligação casa/Universidade | Jogável |
| 20 | Festa de aniversário | Criada; ainda não ligada à Room 7 |

Fluxo atual: `1 → 2 → 10 → 3 → 4 → 6 → 7`. Fluxo pretendido para release: `1 → 2 → 10 → 3 → 4 → 6 → 7 → 20`.

## Ficheiros principais

- `GlobalScript.asc/.ash`: estado global, input, inventário e lógica partilhada.
- `VerbCoin.asc/.ash`: interface de ações.
- `roomN.asc`: lógica textual da sala.
- `roomN.crm`: dados binários geridos pelo editor; não editar à mão.
- `Game.agf`: personagens, itens, dialogs, views, GUIs, sprites e salas.
- `Assets/` e `Sprites/`: ficheiros-fonte visuais.
- `Compiled/`: resultados do build; regenerar apenas no lançamento.

## Personagens e views relevantes

| Personagem | Local/view |
|---|---|
| `cGabriel` | jogador; Starting Room 1; view normal 2 |
| `cVania` | Room 2; `RealName` ainda é `New character` |
| `cPraxistas` | Room 3; normal 6, speech 8 |
| `cFuncionaria` | colocada temporariamente na Room 3 |
| `cLuis` | Room 4; normal 9, speech 10 |
| `cEmpregadaPastelaria` | Room 6; view 11 |
| `cPasteleiro` | colocado na Room 7; normal 12, speech 13 |
| `cFamilia` | Room 20 |

Views especiais de Gabriel: `VIEWGABRIELSACO` na Room 3 e view 14 como ajudante na Room 7. Ambas devem regressar à view normal quando deixam de fazer sentido.

## Inventário

O único item inicial é `iOboe`. `iKey` existe, mas não é inicial nem participa no percurso.

- Room 1: `iNerfs`, `iPistol`, `iPistolL`, `iReed`, `iOboeR`, `iPartitura`.
- Room 3: `iFolhetos`, `iCopos`, `iSacoLixo`.
- Room 4: `iFitaCola`, `iRegua`, `iReguaComFita`, `iRascunho`, `iGrelhaCorrecao`, `iFrasco`, `iCopoAgua`, `iFrascoComAgua`, `iPoEfervescente`, `iSuspensao`, `iChavesLuis`.
- Room 7: `iBirthdayCake`.

## Estado persistente importante

- Room 1: `gabriel_practiced_oboe` e `partitura_on_tripe`.
- Room 3: `praxe_state`, `praxistas_dialog_result` e estado local do lixo.
- Room 4: flags `gabinete_*` e estado local dos objetos.
- Room 6: disfarce e autorização da empregada.
- Room 7: `enteredKitchen`, `cartazGregoResolvido`, `ampulhetasResolvidas`, `boloIdentificado`, `cakePuzzleSolved`, `pastelariaConcluida`, `cakeInOven` e estado das ampulhetas.

## Riscos conhecidos

- `warnings.log`: movimento bloqueante em Before fade-in, `room1.asc:340`.
- Room 7 inicia dois dialogs no mesmo evento ao começar as ampulhetas.
- Room 7 tenta parar um dialog e iniciar outro no mesmo callback ao resolver as ampulhetas.
- As saídas após a pastelaria regressam atualmente às Rooms 1 ou 2, em vez da Room 20.
- O estado `comPai` está duplicado e os dois caminhos de conclusão da Room 4 não movimentam Luís da mesma forma.
- Alguns objetos de inventário podem ser revelados novamente na Room 1.
- A canção da Room 20 corre em cada After fade-in e não existe encerramento/créditos.
- Os sprites-fonte de Luís foram atualizados; é necessário restaurá-los no AGS e recompilar.

## Validação de release

1. Restaurar sprites a partir das fontes.
2. Corrigir os bloqueadores listados em `afazer_joao.md`.
3. Compilar sem erros nem avisos.
4. Jogar de novo da Room 1 à Room 20, com save/load nos puzzles.
5. Gerar Windows, Linux e Web.
6. Testar os pacotes finais fora do editor.
7. Confirmar permissões executáveis do Linux e que os três targets contêm os mesmos dados do jogo.
