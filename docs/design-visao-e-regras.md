# Design, visao e regras

## Ideia central

`Aventurao` e uma aventura point-and-click em portugues sobre Gabriel, um rapaz de 9 anos que acorda num dia aparentemente normal. A introducao atual define logo o tom:

> Gabriel, 9 anos, acha que hoje vai ser um dia normal. Spoiler: nao vai ser.

O jogo comeca no quarto de Gabriel e trata objetos banais como se fossem sinais de uma aventura maior. A piada vem do contraste entre uma crianca a tentar agir como heroi e um mundo domestico que resiste, julga, esconde coisas e cria pequenos problemas absurdos.

## Tom

- Humor seco, infantil-esperto e ligeiramente dramatico.
- Gabriel comenta o mundo como se objetos comuns tivessem personalidade ou intencoes.
- As respostas de erro tambem devem ter piada; nao devem soar genericas.
- O jogo deve continuar em portugues.
- O texto atual usa ASCII por seguranca nos scripts AGS, por isso muitos acentos aparecem omitidos. Se mudares isto, confirma primeiro que a codificacao se mantem estavel no AGS.

## Regras de interacao impostas

- O jogador controla Gabriel.
- O jogo usa verb coin, nao uma lista fixa de verbos no fundo do ecra.
- Verbos principais:
  - `Olhar`
  - `Falar`
  - `Usar`
  - `Pegar`
- Clique esquerdo num hotspot/objeto/personagem abre a verb coin.
- Clique direito abre o inventario quando nada esta selecionado.
- Clique esquerdo num item de inventario seleciona-o.
- Clique esquerdo noutro item de inventario tenta combinar itens.
- Clique direito num item de inventario examina-o.
- Se um item de inventario estiver ativo, clicar no mundo usa esse item no alvo.
- Escape fecha interfaces abertas; se nada estiver aberto, abre o painel.

## Regras de puzzle

- Puzzles devem ser resolvidos por observacao e combinacao de objetos.
- Objetos podem estar escondidos ate Gabriel olhar/interagir com o sitio certo.
- A solucao deve fazer sentido dentro da logica de uma crianca: improviso, brinquedos, instrumentos, coisas do quarto.
- O jogador deve receber feedback quando ainda nao consegue fazer algo.
- Sempre que um objeto muda de estado, o inventario deve refletir isso trocando itens em vez de manter duplicados.

Exemplos ja implementados:

- `Pistola Nerf` + `Nerfs` = `Pistola Nerf (carregada)`.
- `Oboe` + `Palheta` = `Oboe com palheta`.
- A `Partitura` so se torna apanhavel depois de cair.

## Escolhas importantes ja feitas

- Gabriel e o protagonista, personagem jogavel `cChar1`.
- Roger existe como personagem secundaria em `cRoger`, na sala 1, com dialogo ainda provisiorio.
- A primeira sala e o quarto.
- O quarto tem hotspots/objetos como desenho, luz, porta, cama, sofa, caneca, Nerfs, pistola e partitura.
- A partitura esta alta/inacessivel no inicio.
- A pistola de Nerfs e usada para atingir o desenho/area alta e fazer cair a partitura.
- O oboe e a palheta sao combinados para criar `Oboe com palheta`.
- A mae impede Gabriel de acabar a noite enquanto ele nao praticar oboe.
- A pratica exige dois passos: por a partitura no tripe e depois usar o oboe com palheta nessa partitura.
- A primeira pratica desbloqueia a cama/Room 2; praticas seguintes podem repetir a animacao sem alterar a historia.
- O jogo tem musica `adventure_theme.mid` e fundo `quarto_bg.jpg`.

## Linguagem de Gabriel

Manter este tipo de frase:

- "Uma porta. O universo inventou isso para me contrariar."
- "Tem cara de arte e cheiro de problema."
- "Parece normal. Estranhamente normal."
- "Ideia engracada. Ideia ruim."

Evitar texto seco como "Nao podes fazer isso". Preferir respostas que revelem personalidade.

