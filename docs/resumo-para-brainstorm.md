# Aventurao — resumo para brainstorm de novas Rooms

## Como usar este documento

Este texto foi preparado para ser copiado para um chat como contexto antes de pedir ideias para novas Rooms. O objetivo é gerar propostas compatíveis com o jogo existente, sem repetir puzzles já usados e sem perder o tom.

---

## Resumo do projeto

`Aventurao` é uma aventura point-and-click em português europeu, feita em Adventure Game Studio (AGS). O protagonista é Gabriel, um rapaz de 9 anos inteligente, observador e muito confiante. Ele encara tarefas domésticas, adultos, instituições e objetos banais como se fossem partes de uma grande aventura.

O humor é seco, infantil-esperto e ligeiramente dramático. O mundo aceita situações absurdas com enorme seriedade. Gabriel resolve problemas com improviso, objetos comuns, conversa e confiança, não com força ou explicações elaboradas.

Exemplos do tom:

- “Uma porta. O universo inventou isso para me contrariar.”
- “Cinco praxistas muito juntos. Parecem uma única criatura académica.”
- “A geometria também serve para alinhar pequenos delitos.”
- “Bolos atrás de vidro. Uma medida de segurança sensata e cruel.”

As respostas erradas também devem ter personalidade e, quando possível, dar uma pista. Evitar mensagens genéricas como “Não podes fazer isso”.

## Interface e regras de jogo

O jogo usa uma verb coin com quatro ações:

- `Olhar`.
- `Falar`.
- `Usar`.
- `Pegar`.

O jogador pode:

- Examinar hotspots, objetos, personagens e itens de inventário.
- Falar com personagens através de diálogos com opções.
- Recolher objetos.
- Usar itens no cenário ou em personagens.
- Combinar dois itens de inventário.

Os puzzles devem privilegiar:

- Observação do cenário.
- Combinação lógica de objetos.
- Mudanças visuais de estado.
- Diálogos em várias etapas.
- Soluções que façam sentido para uma criança criativa.
- Tentativas erradas recuperáveis, sem dead ends.

Quando dois itens são combinados, os componentes são normalmente consumidos e substituídos por um novo item. O inventário não deve conservar duplicados sem razão narrativa.

## Personagens existentes

### Gabriel

Protagonista de 9 anos. Inteligente, curioso e teatral. Improvisa depressa e fala com confiança. Não inventa mentiras complexas: diz o mínimo necessário e deixa os adultos preencherem o resto.

### Vânia

Mãe de Gabriel. Representa a autoridade doméstica. É ela que o obriga a praticar oboé e depois o manda procurar o Pai.

### Luís

Pai de Gabriel. Trabalha na Universidade e corrige exames. É competente, cansado e recetivo às soluções improvisadas do filho. Depois da Room 4 pode acompanhar Gabriel, embora esta integração ainda precise de ser afinada.

### Praxistas

Grupo de cinco estudantes que protege a Porta Férrea. São muito confiantes enquanto grupo, mas entram em pânico perante qualquer regra académica que desconheçam.

### Funcionária da Universidade

Troca o saco do caixote na Room 3 depois de Gabriel o encher.

### Empregada do Moinho Velho

Simpática, atarefada e demasiado disposta a acreditar que Gabriel é o novo ajudante.

### Chefe pasteleiro

Exigente e obcecado por matemática. Trata geometria, lógica e pastelaria como a mesma disciplina.

### Roger

Personagem provisória, atualmente sem papel narrativo definido.

## Percurso implementado

O fluxo jogável atual é:

`Room 1 → Room 2 → Room 10 → Room 3 → Room 4 → Room 6 → Room 7`

A Room 5 existe como Estação Fernando Namora, mas ainda não tem jogabilidade e não está integrada.

### Room 1 — quarto de Gabriel

Objetivo: praticar oboé antes de se deitar.

Puzzles:

- Examinar uma caneca para encontrar a palheta.
- Combinar palheta e oboé.
- Procurar Nerfs escondidos no sofá.
- Combinar Nerfs com uma pistola descarregada.
- Disparar contra uma área alta para fazer cair a partitura.
- Colocar a partitura no tripé.
- Usar o oboé preparado na partitura para praticar.

Depois da prática, Gabriel pode usar a cama e avançar.

### Room 2 — casa

Vânia manda Gabriel ir buscar Luís à Universidade. É sobretudo uma transição narrativa.

### Room 10 — ligação provisória

Funciona como ligação entre a casa e a Universidade. Pode vir a ser substituída ou complementada pela Room 5.

### Room 3 — Porta Férrea

Objetivo: passar por cinco praxistas.

Puzzles:

- Apanhar cartazes e copos usados.
- Deitá-los num caixote para o encher.
- Esperar que uma funcionária troque o saco.
- Apanhar o saco limpo e vesti-lo como se fosse uma capa académica.
- Convencer os praxistas de que estão a usar uma dobra obsoleta.
- Inventar um artigo e uma sanção que os manda reaprender a dobra longe da entrada.

O humor depende de ninguém comentar que Gabriel está vestido com um saco do lixo.

### Room 4 — gabinete de Luís

Objetivo: ajudar o Pai a terminar o último exame e encontrar as chaves.

Puzzles:

- Combinar régua e fita-cola para criar uma ferramenta pegajosa.
- Pescar um rascunho debaixo de um armário.
- Usar a pista “página 47” para encontrar uma folha da grelha numa estante.
- Combinar frasco, água e pó para preparar uma suspensão.
- Demonstrar o conceito a Luís para identificar a resposta ilegível.
- Procurar as chaves debaixo de uma pilha de exames.

O fluxo atual segue diretamente para a pastelaria.

### Room 5 — Estação Fernando Namora

Existe um background de estação, mas ainda não há puzzle nem transições. É uma candidata natural a hub de viagem para destinos futuros.

### Room 6 — entrada da pastelaria Moinho Velho

Objetivo: entrar na cozinha.

Puzzles:

- Mover um banco para debaixo de um avental alto.
- Vestir o avental.
- Colocar um chapéu descartável.
- Apresentar-se à empregada como o novo ajudante.

O avental e o chapéu formam um disfarce, mas não são itens permanentes de inventário.

### Room 7 — cozinha do Moinho Velho

Objetivo: ajudar a terminar e identificar o bolo de aniversário de Gabriel.

Puzzles:

1. Interpretar corretamente um cartaz grego sobre geometria.
2. Medir exatamente nove minutos com ampulhetas de 4 e 7 minutos.
3. Resolver um puzzle lógico com cinco bolos, cinco donos, formas, sabores e decorações.

A solução dos bolos é:

- A — Mariana.
- B — Tiago.
- C — Rita.
- D — Gabriel.
- E — Patrícia.

Gabriel recebe o bolo de aniversário no fim.

## Mecânicas e ideias já utilizadas

Evitar repetir estas ideias como puzzle central de uma nova Room, salvo se houver uma variação forte:

- Objeto escondido dentro de uma caneca.
- Objeto escondido num sofá.
- Combinar munição com uma arma de brinquedo.
- Derrubar um objeto alto com um projétil.
- Colocar partitura num suporte e tocar um instrumento.
- Encher um caixote para provocar a troca do saco.
- Disfarce com saco do lixo.
- Enganar um grupo inventando regulamentos.
- Régua com fita-cola para alcançar um papel.
- Procurar uma página indicada por um rascunho.
- Misturar água e pó para demonstrar uma suspensão.
- Encontrar chaves sob uma pilha de papéis.
- Mover um banco para alcançar roupa.
- Disfarce de empregado com avental e chapéu.
- Pergunta de tradução/interpretação com respostas múltiplas.
- Medição de tempo com ampulhetas.
- Logic grid de pessoas e objetos.

Podem regressar mecânicas básicas — examinar, combinar, conversar, alterar estados — mas a fantasia concreta do puzzle deve ser nova.

## Objetos e temas recorrentes

- Oboé e música.
- Brinquedos e soluções de criança.
- Universidade de Coimbra e burocracia académica.
- Família e tarefas impostas pelos pais.
- Aniversário de Gabriel.
- Transportes e deslocação pela cidade.
- Adultos que aceitam premissas absurdas.
- Regras, formulários, tradições e profissões levados demasiado a sério.

## Pontos ainda em aberto

- Qual é o objetivo da história depois de Gabriel obter o bolo?
- Luís acompanha Gabriel ou segue para outro destino?
- A Room 5 torna-se um hub permanente de viagem?
- Para onde deve regressar Gabriel depois da pastelaria: casa, estação ou outro local?
- Qual será a função da chave inicial (`iKey`)?
- Roger terá uma função ou será removido?
- O bolo termina um capítulo ou inicia uma nova complicação?

Novas Rooms podem ajudar a responder a estas perguntas, mas devem indicar claramente qualquer decisão narrativa assumida.

## Restrições técnicas e de produção

- Jogo feito em AGS, resolução `800x600`.
- Cada Room deve ser viável com hotspots, objetos, personagens, dialogs e inventário tradicionais do AGS.
- Evitar propostas que dependam de física complexa, geração procedural, combate em tempo real ou interfaces muito diferentes sem uma boa razão.
- Dar preferência a 1–3 puzzles encadeados por Room.
- Uma Room deve ter um objetivo claro, mudanças de estado visíveis e uma saída narrativa.
- Os nomes e handlers devem poder ser expressos como scripts AGS simples.
- O texto do jogo é em português europeu; nos scripts pode ser necessário usar ASCII até a codificação ser validada no editor.

## O que pedir no brainstorm

Para cada nova Room, a proposta deve incluir:

1. Nome e local.
2. Objetivo narrativo de Gabriel.
3. Personagens presentes e respetiva motivação.
4. Elementos visuais importantes do cenário.
5. Puzzle principal e pistas.
6. Um ou dois puzzles secundários, se fizer sentido.
7. Itens recolhidos, combinados, consumidos ou transportados para outra Room.
8. Estados visuais antes e depois da solução.
9. Exemplos de falas no tom do jogo.
10. Ligação à Room anterior e à seguinte.
11. Riscos de implementação no AGS.
12. Indicação explícita de como a ideia evita repetir puzzles existentes.

## Prompt sugerido para outro chat

> Com base no contexto abaixo, propõe novas Rooms para o jogo Aventurao. Mantém o humor seco e infantil-esperto, usa português europeu e cria puzzles de aventura point-and-click baseados em observação, diálogo, inventário e mudanças de estado. Não repitas como puzzle central nenhuma das ideias listadas como já utilizadas.
>
> Para cada proposta, inclui: nome/local, objetivo narrativo, personagens, cenário, sequência completa dos puzzles, pistas, tentativas erradas, itens, mudanças visuais, falas de exemplo, ligação entre Rooms e dificuldade de implementação em AGS.
>
> Apresenta primeiro 8 conceitos curtos e distintos. Depois escolhe os 3 mais fortes e desenvolve-os em detalhe. Procura variedade: pelo menos uma Room doméstica, uma exterior e uma institucional ou comercial. Explica como cada ideia continua a história depois da obtenção do bolo e que decisões assume sobre a Room 5, Luís, a chave inicial e o destino final.

Pode copiar este documento inteiro depois do prompt ou fornecer primeiro as secções “Resumo do projeto”, “Percurso implementado”, “Mecânicas e ideias já utilizadas” e “Pontos ainda em aberto”.
