# AGENTS.md

Instrucoes para agentes que trabalhem neste repositorio.

## Visao Geral

Este projeto e um jogo feito em Adventure Game Studio (AGS). A logica editavel fica principalmente nos scripts `.asc` e headers `.ash`; salas, sprites, fontes e builds compilados incluem varios arquivos binarios que devem ser tratados com cuidado.

## Estrutura Principal

- `Game.agf`: arquivo principal do projeto AGS.
- `GlobalScript.asc` / `GlobalScript.ash`: script global e imports compartilhados.
- `room1.asc` / `room1.crm`: script e dados da sala 1.
- `VerbCoin.asc` / `VerbCoin.ash`: modulo da interface VerbCoin.
- `Assets/`: assets-fonte como imagens e musica.
- `Sprites/`: sprites exportados/organizados.
- `Compiled/`: builds gerados pelo AGS.
- `AudioCache/`, `acsprset.spr`, `sprindex.dat`, `*.crm`, `*.agf`: arquivos geridos pelo AGS.

## Regras de Edicao

- Prefira editar scripts de texto (`.asc`, `.ash`) quando a mudanca for de comportamento.
- Nao regrave, formate ou regenere arquivos binarios do AGS sem necessidade clara.
- Evite alterar `Compiled/` a menos que a tarefa seja explicitamente gerar ou atualizar build.
- Preserve nomes de eventos usados pelo AGS. Funcoes como `hPorta_Look`, `oCup_PickUp` e similares sao ligadas a objetos/hotspots pelo editor.
- Ao adicionar interacoes, siga a assinatura AGS existente para o tipo correto:
  - `Hotspot *theHotspot, CursorMode mode`
  - `Object *theObject, CursorMode mode`
  - `GUIControl *control, MouseButton button`
- Mantenha textos do jogo no mesmo tom atual: aventura leve, infantil, com humor em portugues.
- O projeto contem texto com problemas de encoding em alguns pontos. Antes de "corrigir" acentos em massa, confirme se o AGS/editor esta a interpretar o arquivo corretamente.

## Convencoes de Codigo

- Use indentacao de dois espacos nos scripts AGS, acompanhando o estilo atual.
- Prefira nomes de funcoes descritivos e compativeis com os nomes de objetos/hotspots no editor.
- Mantenha imports e defines compartilhados em headers `.ash`; nao coloque implementacoes ali.
- Evite abstracoes novas no script global se a mudanca for localizada a uma sala ou objeto.
- Comentarios devem explicar intencao de jogo ou comportamento nao obvio, nao repetir o codigo.

## Validacao

Quando possivel, valide pelo Adventure Game Studio Editor:

1. Abra `Game.agf`.
2. Compile/teste o jogo pelo editor.
3. Confira `warnings.log` apos compilar.

Avisos conhecidos no estado atual podem aparecer em `warnings.log`; investigue antes de assumir que foram introduzidos pela sua alteracao.

Se nao houver AGS disponivel no ambiente, faca pelo menos:

- Revisao manual dos scripts alterados.
- Busca por funcoes de evento renomeadas ou removidas.
- `git diff` para confirmar que apenas os arquivos esperados mudaram.

## Git

- Nao reverta alteracoes do utilizador sem pedido explicito.
- Antes de mudar arquivos binarios grandes, confirme se isso e realmente necessario.
- Mantenha commits focados: scripts, assets e builds devem ser separados quando possivel.
