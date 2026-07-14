# Room6.md
# Adventure Game – Room 5: A Pastelaria

## Objetivo

Gabriel vai levantar o bolo do seu 10.º aniversário.

Ao chegar descobre que o bolo ainda não está pronto.

Para o conseguir terá de:

1. Convencer a empregada de que é o novo ajudante de cozinha.
2. Entrar na cozinha.
3. Ajudar o chefe pasteleiro a medir exatamente 9 minutos de cozedura usando duas ampulhetas.
4. Descobrir qual dos cinco bolos é o seu.
5. Levar finalmente o bolo para casa.

---

# ROOM 6A – Entrada da Pastelaria

## Cenário

Pastelaria tradicional portuguesa.

Objetos visíveis:

- Balcão
- Montra
- Porta para a cozinha
- Cabide
- Banco pequeno
- Caixa com chapéus descartáveis
- Alguns clientes

A porta da cozinha está atrás do balcão.

---

# Personagens

## Gabriel

Protagonista.

---

## Empregada

- Simpática.
- Muito atarefada.
- Acredita facilmente nas pessoas.
- Nunca viu o novo aprendiz.

---

# Objetos

## Cabide

Contém um avental.

Está demasiado alto.

---

## Banco

Pode ser empurrado.

Permite alcançar o avental.

---

## Caixa de chapéus

Contém chapéus descartáveis.

Gabriel coloca um automaticamente.

---

## Porta da cozinha

Inicialmente fechada.

---

# Estado

```text
hasApron = false
hasHat = false
isDisguised = false

enteredKitchen = false
```

---

# Objetivo

Entrar na cozinha.

---

# Diálogo inicial

Gabriel

"Olá.

Vim buscar o bolo do meu aniversário."

Empregada

"Ainda não está pronto."

"O chefe ainda está a acabar as coberturas."

Gabriel

"Posso esperar?"

Empregada

"Se quiseres."

Gabriel

(examina a porta da cozinha)

---

Se tentar entrar:

Empregada

"Clientes não entram."

---

# Puzzle 1 – Disfarce

O jogador deve:

- mover o banco
- subir ao banco
- apanhar o avental
- pegar num chapéu

Quando ambos forem obtidos:

```text
isDisguised = true
```

Sprite muda automaticamente.

---

# Novo diálogo

Gabriel

"Sou o novo ajudante."

Empregada

"Ah!"

"És tu?"

Gabriel

"..."

Empregada

"O chefe disse que hoje vinha alguém novo."

"Entra rapidamente.

Ele está de péssimo humor."

Abre a porta.

Transição para a cozinha.

---

# ROOM 6B – Cozinha

## Cenário

Grande cozinha industrial.

Objetos:

- Forno
- Bancada
- Livro de encomendas
- Cinco bolos
- Duas ampulhetas
- Cartaz grego

---

# Personagens

## Chefe Pasteleiro

Características

- Obcecado por matemática.
- Muito exigente.
- Acredita que cozinhar é uma forma de geometria.

---

# Objetos

## Cartaz

Texto:

> Ἀγεωμέτρητος μηδεὶς εἰσίτω

Se examinado:

Gabriel

"Parece grego..."

---

# Diálogo inicial

Pasteleiro

"Tu deves ser o novo ajudante."

"Antes de começares..."

"Sabes o que diz o cartaz?"

---

## Pergunta

Opções

❌

"Entrada proibida."

---

❌

"Proibido fumar."

---

❌

"É o menu."

---

✅

"Que não entre quem não souber geometria."

---

Pasteleiro

"Exatamente."

"A maioria entra sem reparar."

Gabriel

"Porque é que isso está numa cozinha?"

Pasteleiro

"Porque cozinhar é matemática."

---

# Puzzle 2 – Ampulhetas

## Situação

Pasteleiro

"A cobertura do teu bolo tem de cozer exatamente nove minutos."

"O temporizador avariou."

"Só tenho estas duas ampulhetas."

Mostra:

- ampulheta de 4 minutos
- ampulheta de 7 minutos

---

## Interface

Todo o puzzle decorre por diálogo.

O jogador pode repetir ações.

As opções disponíveis são sempre:

- Virar a ampulheta de 4 minutos
- Virar a ampulheta de 7 minutos
- Esperar
- Tirar a cobertura do forno

---

## Estado

```text
globalTime

glass4Running
glass7Running

glass4Remaining
glass7Remaining

cakeInOven
```

---

## Início

A primeira vez que ambas as ampulhetas ficam a correr:

```text
cakeInOven = true

globalTime = 0
```

O chefe coloca automaticamente a cobertura no forno.

---

## Esperar

Sempre que o jogador escolhe "Esperar":

O jogo avança até à próxima ampulheta terminar.

O chefe anuncia sempre o estado.

Exemplos:

"Já passaram quatro minutos."

"Já passaram sete minutos."

"Já passaram oito minutos."

Etc.

---

## Tirar a cobertura

Se

```text
globalTime < 9
```

Pasteleiro

"Ainda está crua."

Continua o puzzle.

---

Se

```text
globalTime == 9
```

Pasteleiro

"Perfeita."

Puzzle resolvido.

---

Se

```text
globalTime > 9
```

Pasteleiro

"..."

"Passou do ponto."

"A cobertura ficou arruinada."

Fade curto.

Nova cobertura.

O diálogo reinicia desde o início do puzzle.

Todas as variáveis voltam ao estado inicial.

---

# Puzzle 3 – Qual é o bolo?

Pasteleiro

"Agora há outro problema."

"O meu ajudante misturou as etiquetas."

"Não faço ideia de qual é o teu bolo."

Existem cinco bolos.

Cada um possui

- forma
- cobertura
- decoração

---

## Livro de encomendas

Pode ser consultado.

Contém apenas algumas características.

Exemplo:

Gabriel

- oboé

Patrícia

- sem chocolate

Tiago

- futebol

Mariana

- flores

Rita

- estrelas

---

## Pistas

As pistas devem permitir dedução lógica.

Exemplos:

Cliente

"O meu é o único sem chocolate."

---

Pasteleiro

"O bolo do futebol é redondo."

---

Pasteleiro

"Nunca faço bolos musicais em forma de coração."

---

Livro

"O bolo do Gabriel tem um oboé."

---

Devem existir pistas suficientes para que apenas um bolo satisfaça todas as condições.

---

## Escolha

O jogador escolhe um dos cinco bolos.

---

### Errado

Pasteleiro

"Esse quase de certeza que não é."

O bolo regressa ao lugar.

---

### Certo

Pasteleiro

"Claro!"

"É esse."

Coloca a cobertura acabada de fazer.

Entrega o bolo.

---

# Final

Pasteleiro

"Não és mau."

Gabriel

"Obrigado."

Pasteleiro

"Se continuares assim..."

"...daqui a uns anos ainda acabas engenheiro."

Gabriel sorri.

Sai cuidadosamente da cozinha.

Transição para a saída da pastelaria.

Fade out.

---

# Flags finais

```text
cakePuzzleSolved = true

inventory += BirthdayCake

RoomCompleted = true
```

---

# Notas de implementação

- O puzzle das ampulhetas deve ser implementado como uma máquina de estados simples.
- O tempo **nunca** avança continuamente; apenas quando o jogador escolhe "Esperar".
- O chefe anuncia sempre quantos minutos passaram após cada espera, para que o jogador nunca tenha de memorizar o estado.
- Se ultrapassar os 9 minutos, o puzzle reinicia imediatamente.
- O puzzle dos bolos deve ser um verdadeiro puzzle de dedução, com solução única, idealmente usando 5 bolos × 4 propriedades (dono, forma, cobertura e decoração).
- O tom deve ser leve, absurdo e próximo de *Monkey Island*: as personagens aceitam situações ridículas com toda a naturalidade.