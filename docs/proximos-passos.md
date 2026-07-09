# Proximos passos

## Prioridade alta

- Rever se `iPistolL` deve ser item inicial. Se for so para teste, mudar `PlayerStartsWithItem` para `False` no AGS Editor.
- Corrigir o aviso `sofa_MouseMove` em falta.
- Corrigir ou padronizar acentos nos scripts, porque alguns textos aparecem com mojibake.
- Dar nome/descricao final a `iPartitura`; atualmente esta como `New inventory item`.
- Testar do inicio ao fim o puzzle da partitura sem itens de debug.

## Conteudo a desenhar

- Definir objetivo narrativo da primeira sala: por que Gabriel precisa da partitura?
- Decidir funcao do `Oboe com palheta`.
- Decidir funcao da `Key`.
- Reescrever dialogo do Roger, que ainda parece placeholder.
- Dar mais linhas personalizadas a objetos importantes em vez de depender de `unhandled_event`.

## Melhorias de jogo

- Evitar que o jogador fique com solucao antes de descobrir o puzzle, caso `iPistolL` seja removido dos itens iniciais.
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
