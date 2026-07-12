# Afazer Joao

Pendencias que ainda exigem configuracao ou validacao visual no AGS Editor.

## Room 1

- Confirmar se o evento Pick up do sofa ainda aponta para `sofa_PickUp`; remover a ligacao se o warning persistir e a interacao nao for necessaria.
- Testar o fluxo completo da partitura, tripe e oboe e confirmar que os hotspots sao faceis de selecionar.

## Room 2

- Confirmar a transicao narrativa da Room 2 para a Room 3.

## Room 3 - Porta Ferrea

- Na `ViewGabrielSaco`, configurar quatro loops de caminhada, todos com quatro frames `100x160`, velocidade aproximada de 5 e pela ordem numerica: loop 0=`Sprites/Room3/GabrielSaco/Walk/gabriel_saco_walk_down_0.png` a `_3.png`; loop 1=`gabriel_saco_walk_left_0.png` a `_3.png`; loop 2=`gabriel_saco_walk_right_0.png` a `_3.png`; loop 3=`gabriel_saco_walk_up_0.png` a `_3.png`. Todos usam o Gabriel correto e mantem o saco/capa vestido.
- Confirmar que `hLixo` usa `hLixo_Look` e `hLixo_UseInv`; e que `oLixo`/`oCaixote` usam os handlers Look/UseInv homonimos.
- Confirmar que `oLixo` e `oCaixote` estao exatamente sobrepostos e usam, respetivamente, `Sprites/Room3/Caixote/caixote_vazio.png` e `caixote_cheio.png`.
- Confirmar que o loop 3 da `ViewFuncionaria` contem os cinco frames `Sprites/Room3/Funcionaria/TrocarSaco/trocar_saco_0.png` a `trocar_saco_4.png`.
- No loop 3 da `ViewPraxistas`, reimportar `Sprites/Room3/PraxistasSaida/praxistas_saida_0.png` a `praxistas_saida_4.png`, por ordem, sem Flip. Os cinco frames foram corrigidos para `280x240`, com baseline e centro comuns e pelo menos 20 px de margem vertical; o script repete este loop enquanto move o grupo para fora do ecra.
- Testar o puzzle completo: apanhar cartazes e copos, deita-los no lixo, observar a funcionaria, apanhar o saco, selecionar o saco no inventario e usa-lo em Gabriel, falar com `cPraxistas` e entrar na Room 4.

## Room 5 - Estacao Fernando Namora

- No AGS Editor, criar a Room 5 com resolucao `800x600` e importar `Assets/estacao_fernando_namora_room5.png` como background. O ficheiro `Assets/estacao_fernando_namora_source.png` e a fonte em alta resolucao e nao precisa de ser importado.
- Desenhar uma walkable area ampla na plataforma em primeiro plano. Evitar incluir a faixa vermelha, os carris de protecao, os canteiros e os abrigos; ajustar os limites para o Gabriel nao atravessar esses elementos.
- Criar hotspots separados para os destinos e dar-lhes nomes claros, por exemplo `hUniversidade` e `hCasa`. Reservar desde ja espaco para mais dois ou tres hotspots de destinos futuros, sem lhes atribuir uma Room enquanto as localizacoes nao estiverem definidas.
- Ligar a Universidade ao numero da Room da Universidade (atualmente a Room 2, se essa numeracao se mantiver) e ligar Casa ao numero da Room da casa/quarto (atualmente a Room 1, se essa numeracao se mantiver). Confirmar os numeros no painel Rooms antes de escrever o script.
- Para cada destino, associar o evento Any click ao respetivo handler. Exemplo, depois de confirmar os numeros das Rooms:

```ags
function hUniversidade_AnyClick(Hotspot *theHotspot, CursorMode mode)
{
  player.ChangeRoom(2);
}

function hCasa_AnyClick(Hotspot *theHotspot, CursorMode mode)
{
  player.ChangeRoom(1);
}
```

- Para os destinos ainda por decidir, pode deixar os hotspots por criar ou usar temporariamente uma mensagem como `Display("Esta linha ainda nao abriu. Nem o motorista sabe para onde vai.");`, sem chamar `ChangeRoom`.
- Em cada Room de destino, criar tambem a ligacao de regresso a Estacao Fernando Namora com `player.ChangeRoom(5);`, caso a nova sala fique efetivamente com o numero 5.
- Definir o ponto de entrada do Gabriel numa zona livre da plataforma e testar todas as chegadas e regressos para garantir que ele nao aparece dentro de um abrigo, canteiro ou faixa de circulacao.
- Compilar, confirmar que os nomes dos handlers no editor coincidem exatamente com o script e testar Universidade, Casa e os destinos ainda indisponiveis.

## Validacao geral

- Compilar no AGS Editor, rever `warnings.log` e distinguir avisos antigos de erros introduzidos pela Room 3.
