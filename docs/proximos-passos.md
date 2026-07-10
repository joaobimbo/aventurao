# Proximos passos

## Prioridade alta

- Corrigir ou padronizar acentos nos scripts, porque alguns textos aparecem com mojibake.
- Testar do inicio ao fim o puzzle da partitura sem itens de debug.
- Confirmar no AGS Editor se a grelha de inventario `72x80` fica confortavel com mais itens.

## Conteudo a desenhar

- Definir objetivo narrativo da primeira sala: por que Gabriel precisa da partitura?
- Decidir funcao do `Oboe com palheta`.
- Decidir funcao da `Key`.
- Reescrever dialogo do Roger, que ainda parece placeholder.
- Dar mais linhas personalizadas a objetos importantes em vez de depender de `unhandled_event`.

## Melhorias de jogo

- Adicionar feedback quando o jogador tenta usar a pistola descarregada no desenho.
- Adicionar feedback quando tenta usar Nerfs sem pistola ou pistola sem Nerfs.
- Criar uma pequena recompensa/estado depois de apanhar a partitura.
- Confirmar se `oCup_PickUp` deve apanhar a palheta ou se isso deve ficar exclusivamente em `oReed_PickUp`.

## Checklist rapido antes de continuar no outro PC

- Abrir `Game.agf`.
- Ver se a sala 1 carrega.
- Compilar uma vez.
- Ver `warnings.log`.
- Jogar a partir de novo jogo.
- Confirmar inventario inicial.
- Testar: sofa -> Nerfs -> pistola -> carregar -> usar no desenho -> apanhar partitura.
- Testar: caneca -> palheta -> combinar com oboe.
