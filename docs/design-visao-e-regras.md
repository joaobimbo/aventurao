# Design, visão e regras

## Ideia central

`Aventurao` é uma aventura point-and-click em português europeu sobre Gabriel, um rapaz de 9 anos que transforma tarefas banais num percurso heroico. O humor nasce do contraste entre a confiança de Gabriel e um mundo adulto que leva objetos, regras e situações absurdas muito a sério.

Percurso principal:

1. Room 1 — pratica oboé antes de se poder deitar.
2. Room 2 — recebe da mãe a missão de ir buscar o Pai à Universidade.
3. Room 10 — ligação entre a casa e a Porta Férrea.
4. Room 3 — engana os praxistas com um saco do lixo vestido como capa.
5. Room 4 — ajuda Luís a corrigir o último exame e recupera as chaves.
6. Room 6 — disfarça-se de ajudante no Moinho Velho.
7. Room 7 — resolve o cartaz grego, as ampulhetas e a atribuição dos bolos.
8. Room 20 — regressa à família com o bolo e termina na festa de aniversário.

A Room 5/Estação Fernando Namora tem background, mas não tem jogabilidade nem ligação ao percurso. `cRoger` também não participa no arco atual.

## Tom e linguagem

- Humor seco, infantil-esperto e ligeiramente dramático.
- Gabriel comenta coisas comuns como se tivessem personalidade ou autoridade.
- Os adultos aceitam o absurdo com seriedade.
- Uma tentativa errada deve dar pista, humor ou caracterização; evitar respostas genéricas.
- Manter português europeu.
- Não normalizar acentos em massa sem confirmar o encoding dentro do AGS Editor.

## Interação

- O jogador controla `cGabriel` com uma verb coin.
- Verbos principais: Olhar, Falar, Usar e Pegar.
- Clique esquerdo num alvo abre a verb coin; numa zona vazia, faz Gabriel andar.
- Clique direito abre o inventário ou fecha a interface atual.
- Clique esquerdo seleciona ou combina inventário; clique direito examina.
- Com um item ativo, clicar no mundo usa-o no alvo.
- Escape fecha a interface atual; sem interface, abre o painel.

## Regras dos puzzles

- A solução resulta de observação, diálogo e combinação de objetos.
- Combinações consomem os componentes e criam um único resultado.
- Mudanças importantes persistem em flags globais ou de sala.
- Erros nunca podem tornar o jogo impossível de concluir.
- Diálogos de puzzle devem poder ser repetidos.
- Itens e recompensas não podem reaparecer depois de recolhidos.

Combinações implementadas:

- `iPistol` + `iNerfs` → `iPistolL`.
- `iOboe` + `iReed` → `iOboeR`.
- `iRegua` + `iFitaCola` → `iReguaComFita`.
- `iFrasco` + `iCopoAgua` → `iFrascoComAgua`.
- `iFrascoComAgua` + `iPoEfervescente` → `iSuspensao`.

## Final pretendido

Ao resolver os cinco bolos, Gabriel recebe `iBirthdayCake` e deve seguir para a Room 20. A festa fecha o arco iniciado no quarto. O jogo deve então apresentar um final inequívoco, com créditos e uma ação para voltar ao menu ou sair.

## Fora do âmbito desta versão

- Integrar a Room 5 no percurso.
- Dar uma função a `iKey`.
- Integrar `cRoger`.

Estas ideias podem ser retomadas depois do lançamento sem bloquear a história atual.
