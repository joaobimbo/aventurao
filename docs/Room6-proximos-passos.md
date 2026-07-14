# Room 6 — próximos passos no AGS

Estado atual:

- A Room 6 usa o novo frontdesk do **Moinho Velho**.
- A Room 7 usa uma cozinha limpa, sem bolos, cartaz, livro, ampulhetas ou utensílios soltos.
- A lógica dos puzzles já existe em `room6.asc`, `room7.asc` e `GlobalScript.asc`.
- Os elementos da cozinha ainda estão representados por hotspots; devem passar a objetos visuais do AGS.

## 1. Criar os sprites transparentes

Criar e importar, de preferência como PNG com transparência:

- [ ] `cartaz_grego.png`, com o texto exato `Ἀγεωμέτρητος μηδεὶς εἰσίτω`.
- [ ] `ampulheta_4.png`.
- [ ] `ampulheta_7.png`, visualmente maior ou claramente diferente da de 4 minutos.
- [ ] `livro_encomendas.png`, aberto num suporte.
- [ ] `bolo_a_futebol.png`: redondo, chocolate, futebol.
- [ ] `bolo_b_flores.png`: quadrado, baunilha, flores.
- [ ] `bolo_c_cerejas.png`: retangular, morango/chocolate, cerejas.
- [ ] `bolo_d_estrelas.png`: hexagonal, caramelo/chocolate, estrelas.
- [ ] `bolo_e_oboe.png`: oval, chocolate negro, oboé de açúcar.

Manter perspetiva, luz quente e paleta castanho/ocre iguais aos backgrounds do Moinho Velho.

## 2. Importar os sprites no AGS

- [ ] Abrir `Game.agf` no AGS 3.6.2.
- [ ] Criar uma pasta de sprites `Room7/Pastelaria`.
- [ ] Importar os dez PNGs com canal alfa.
- [ ] Confirmar que o AGS não recortou margens necessárias nem alterou a transparência.

## 3. Criar os objetos na Room 7

Adicionar estes objetos, aproximadamente nas posições abaixo; ajustar visualmente no editor:

| Objeto AGS | Posição aproximada | Nome de script sugerido |
|---|---:|---|
| Cartaz grego | `x=320–585`, `y=40–180` | `oCartazGrego` |
| Ampulheta de 4 | `x=355–415`, `y=285–390` | `oAmpulheta4` |
| Ampulheta de 7 | `x=415–475`, `y=285–390` | `oAmpulheta7` |
| Livro | `x=610–720`, `y=175–370` | `oLivroEncomendas` |
| Bolo A | `x=165–250`, `y=205–310` | `oBoloA` |
| Bolo B | `x=250–340`, `y=205–310` | `oBoloB` |
| Bolo C | `x=340–440`, `y=205–310` | `oBoloC` |
| Bolo D | `x=440–535`, `y=205–310` | `oBoloD` |
| Bolo E | `x=530–625`, `y=205–310` | `oBoloE` |

- [ ] Definir `Clickable = true`.
- [ ] Definir baselines coerentes: bolos/livro atrás da ilha; ampulhetas sobre a ilha.
- [ ] Desativar room-area scaling nos objetos fixos, salvo se o resultado visual exigir o contrário.

## 4. Ligar os objetos ao script

Atualmente `room7.asc` usa hotspots com estes nomes:

- `hCartazGrego`
- `hAmpulhetas`
- `hLivroEncomendas`
- `hBoloA` a `hBoloE`

Há duas abordagens:

### Abordagem rápida

- [ ] Manter os hotspots existentes para os cliques.
- [ ] Criar os objetos apenas como elementos visuais com `Clickable = false`.
- [ ] Garantir que os hotspots continuam alinhados com os sprites.

Esta opção não exige alterações ao script e permite testar rapidamente o puzzle completo.

### Abordagem recomendada

- [ ] Tornar os objetos clicáveis.
- [ ] Migrar cada evento `Look` e `Interact` do hotspot para o objeto correspondente.
- [ ] Alterar em `room7.asc` os parâmetros de `Hotspot *` para `Object *` e usar os nomes `o...`.
- [ ] Dividir `hAmpulhetas` em `oAmpulheta4` e `oAmpulheta7`, mantendo o diálogo comum `dAmpulhetas`.
- [ ] Apagar ou desativar os hotspots antigos para evitar dois alvos sobrepostos.
- [ ] Guardar a Room 7 para o AGS atualizar as ligações no `.crm`.

## 5. Testar o puzzle das ampulhetas

Solução que deve funcionar:

1. Virar as duas ampulhetas; a cobertura entra no forno e o tempo começa em zero.
2. Esperar até aos 4 minutos.
3. Virar a ampulheta de 4.
4. Esperar até aos 7 minutos.
5. Virar a ampulheta de 7.
6. Esperar até aos 8 minutos.
7. Virar novamente a ampulheta de 7, deixando apenas 1 minuto em cima.
8. Esperar até aos 9 minutos.
9. Tirar a cobertura.

Verificar também:

- [ ] Retirar antes dos 9 minutos não resolve o puzzle.
- [ ] Ultrapassar 9 minutos queima a cobertura e reinicia as duas ampulhetas.
- [ ] Sair e voltar a abrir o diálogo não perde o estado.
- [ ] O estado é preservado num jogo guardado.

## 6. Testar a dedução dos bolos

- [ ] Cada bolo mostra forma, sabor e decoração corretos ao usar `Olhar`.
- [ ] O livro apresenta as pistas de Tiago, Patrícia, Mariana e Rita.
- [ ] A única solução possível é o bolo E, de Gabriel.
- [ ] Escolhas erradas dão a resposta específica e permitem tentar novamente.
- [ ] A escolha correta aplica a cobertura e adiciona `iBirthdayCake` ao inventário.
- [ ] O ícone do inventário é criado a partir do bolo E ou substituído por um sprite próprio.

## 7. Acabamentos visuais e de personagens

- [ ] Criar sprites próprios para a empregada e para o chefe pasteleiro; atualmente reutilizam views existentes.
- [ ] Criar uma variação visual de Gabriel com avental e chapéu.
- [ ] Confirmar que a empregada não tapa a porta, o banco ou a caixa de chapéus.
- [ ] Confirmar que o chefe não tapa o forno nem os bolos.
- [ ] Rever walkable areas, walk-behinds e baselines nas duas rooms.
- [ ] Adicionar animação simples ao forno/cobertura, se desejado.

## 8. Integração e compilação

- [ ] Decidir a ligação narrativa da room anterior para a Room 6.
- [ ] Corrigir `cGabriel.StartingRoom`: ainda aponta para a Room 5, que não existe.
- [ ] Restaurar/reimportar os 81 sprites que o `acsprset.spr` atual não contém.
- [ ] Compilar pelo AGS Editor.
- [ ] Consultar `warnings.log` e distinguir avisos antigos de novos.
- [ ] Fazer um teste integral: entrada → disfarce → cartaz → ampulhetas → bolos → regresso a casa.
