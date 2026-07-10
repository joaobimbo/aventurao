# Proximos passos

## Prioridade alta

- Corrigir ou padronizar acentos nos scripts, porque alguns textos aparecem com mojibake.
- Testar do inicio ao fim o puzzle da partitura/tripe/oboe sem itens de debug.
- Confirmar no AGS Editor se a grelha de inventario `72x80` fica confortavel com mais itens.

## Conteudo a desenhar

- Afinar o objetivo narrativo da primeira sala depois da pratica de oboe e da transicao para a Room 2.
- Decidir funcao da `Key`.
- Reescrever dialogo do Roger, que ainda parece placeholder.
- Dar mais linhas personalizadas a objetos importantes em vez de depender de `unhandled_event`.

## Melhorias de jogo

- Adicionar feedback quando o jogador tenta usar a pistola descarregada no desenho.
- Adicionar feedback quando tenta usar Nerfs sem pistola ou pistola sem Nerfs.
- Testar que repetir o uso do `Oboe com palheta` no tripe toca a animacao sem avancar historia.
- Confirmar se `oCup_PickUp` deve apanhar a palheta ou se isso deve ficar exclusivamente em `oReed_PickUp`.

## Checklist rapido antes de continuar no outro PC

- Abrir `Game.agf`.
- Ver se a sala 1 carrega.
- Compilar uma vez.
- Ver `warnings.log`.
- Jogar a partir de novo jogo.
- Confirmar inventario inicial.
- Testar: sofa -> Nerfs -> pistola -> carregar -> usar no desenho -> apanhar partitura -> por no tripe -> usar oboe com palheta no tripe -> cama -> Room 2.
- Testar: caneca -> palheta -> combinar com oboe.
