# Rooms 6 e 7 — próximos passos no AGS

## O que já está feito

- [x] Background da entrada do Moinho Velho na Room 6.
- [x] Background da cozinha na Room 7.
- [x] Lógica do banco, avental, chapéu e autorização da empregada.
- [x] Lógica e dialog do cartaz grego.
- [x] Máquina de estados das ampulhetas de 4 e 7 minutos.
- [x] Puzzle lógico com cinco bolos e solução única.
- [x] Item final `iBirthdayCake`.
- [x] Sprites próprios da empregada, pasteleiro e Gabriel ajudante referenciados no projeto.
- [x] Objetos visuais do cartaz, ampulhetas, livro e bolos criados/referenciados.

## Validação visual da Room 6

- [ ] Confirmar walkable areas junto ao balcão, banco, avental, chapéus, porta e saída.
- [ ] Ajustar o hotspot do banco para continuar acessível antes e depois do alinhamento narrativo.
- [ ] Confirmar que o avental só é alcançável depois de `bancoAlinhado`.
- [ ] Confirmar que a empregada em `(650,455)`, scaling 90%, não tapa alvos importantes.
- [ ] Confirmar que a introdução só toca uma vez e que uma reentrada preserva as duas peças do disfarce.
- [ ] Testar Falar e Usar na empregada, porque os eventos chegam a `on_call(600–602)`.

## Validação visual da Room 7

- [ ] Confirmar o scaling atual: ampulhetas/livro/cartaz 50%; bolos 35%; pasteleiro 95%.
- [ ] Ajustar baselines para bolos e livro ficarem atrás da ilha e ampulhetas sobre a bancada.
- [ ] Confirmar que `MostrarBolos(false)` esconde também os hotspots na entrada inicial.
- [ ] Confirmar que `CallRoomScript(700)` revela bolos e livro depois da cobertura.
- [ ] Rever sobreposição entre os objetos `o...` e os hotspots `h...`.

## Simplificação recomendada dos alvos

O estado atual é híbrido: há objetos visuais clicáveis e hotspots antigos. Os handlers dos objetos delegam na lógica dos hotspots. Antes de remover qualquer coisa, testar a versão atual no editor.

Se os cliques forem inconsistentes:

1. Escolher os objetos como alvos definitivos.
2. Ligar Look/Interact diretamente em `oCartazGrego`, `oAmpulheta4`, `oAmpulheta7`, `oLivroEncomendas` e `oBoloA`–`oBoloE`.
3. Extrair a lógica comum para helpers que não dependam de `Hotspot *`.
4. Desativar os hotspots antigos no editor.
5. Guardar a Room 7 para atualizar `room7.crm`.

Não apagar já os wrappers: são a compatibilidade entre a configuração atual do `.crm` e o script.

## Testes funcionais

### Disfarce

- [ ] Porta bloqueada sem avental nem chapéu.
- [ ] Porta bloqueada com apenas uma peça.
- [ ] Banco necessário para o avental.
- [ ] Disfarce completo permite entrar e define `enteredKitchen`.
- [ ] Reentrar depois da conclusão não reinicia o episódio.

### Cartaz

- [ ] Três respostas erradas permitem repetir.
- [ ] “Que não entre quem não souber geometria” define `cartazGregoResolvido`.
- [ ] Falar novamente com o chefe abre o desafio das ampulhetas.

### Ampulhetas

Sequência esperada: virar 4, virar 7, esperar 4, virar 4, esperar 7, virar 7, esperar 8, virar 7, esperar 9, retirar.

- [ ] Esperar sem nenhuma ampulheta ativa dá feedback e não altera estado.
- [ ] Retirar antes dos 9 minutos mantém o puzzle ativo.
- [ ] Passar dos 9 minutos faz fade e reset completo.
- [ ] Afastar-se do diálogo e voltar preserva os tempos.
- [ ] Save/load preserva tempos e `cakeInOven`.

### Bolos

- [ ] O livro mostra as nove pistas completas.
- [ ] Cada bolo apresenta a descrição correta.
- [ ] Clicar diretamente num bolo explica que é preciso atribuir os cinco.
- [ ] Uma lista errada reinicia sem indicar qual resposta falhou.
- [ ] Solução: A=Mariana, B=Tiago, C=Rita, D=Gabriel, E=Patrícia.
- [ ] O fim define `boloIdentificado`, `cakePuzzleSolved` e `pastelariaConcluida`.
- [ ] `iBirthdayCake` é adicionado apenas uma vez.

## Integração narrativa

- [ ] Decidir se Luís deve aparecer na entrada da pastelaria depois da Room 4.
- [ ] Escolher a rota final: Room 7 → Room 2, Room 6 → Room 1, ou outra sala.
- [ ] Integrar a Room 5 se a Estação Fernando Namora for o hub de viagem.
- [ ] Restaurar `cGabriel.StartingRoom` para a sala inicial da história depois dos testes da Room 7.
- [ ] Confirmar a view do jogador ao entrar (`14`) e sair (`2`) da cozinha.

## Compilação

- [ ] Compilar no AGS 3.6.2.18.
- [ ] Rever `warnings.log` e separar warnings da pastelaria dos anteriores.
- [ ] Testar novo jogo e save/load.
- [ ] Não atualizar `Compiled/` até a integração estar decidida.
