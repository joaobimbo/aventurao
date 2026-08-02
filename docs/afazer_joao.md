# A fazer no AGS Editor

Checklist manual para preparar uma versão de lançamento. O percurso atual começa corretamente na Room 1 e segue `1 → 2 → 10 → 3 → 4 → 6 → 7`; a Room 20 é o final de aniversário, mas ainda não está ligada ao percurso.

## Bloqueadores de lançamento

- [x] **Atualizar os sprites do Luís:** usar **File → Restore all sprites from sources**, confirmar as views 9 (andar) e 10 (falar) em todas as direções e recompilar. Os PNG em `Sprites/Luis/` já têm o visual novo.
- [x] **Ligar o final:** depois de receber `iBirthdayCake` na Room 7, encaminhar Gabriel para a Room 20, restaurar a view normal antes da mudança de sala e impedir os regressos atuais à Room 1/Room 2.
- [ ] **Corrigir a sequência de diálogos da Room 7:** não iniciar `dIntroducaoAmpulhetas` e `dAmpulhetas` no mesmo evento; não parar `dAmpulhetas` e iniciar `dIntroducaoBolos` dentro do mesmo callback de diálogo. Testar as transições em jogo.
- [X] **Corrigir o aviso da Room 1:** mover o `player.Walk(..., eBlock, ...)` de `room_Load()` (Before fade-in) para After fade-in, ou torná-lo não bloqueante. A compilação deve terminar sem avisos.
- [X] **Desativar Debug mode** em General Settings antes do build final.
- [ ] **Fechar a Room 20:** garantir que o bolo está visível, que Gabriel entra com a view normal e criar um final claro (créditos, voltar ao menu ou sair). A canção não deve repetir após save/load ou reentrada.

## Continuidade visual e estado

- [X] Ao sair da Room 3, retirar a view do saco do lixo e confirmar as quatro direções da view normal de Gabriel.
- [ ] Na Room 6, dar feedback visual ao vestir avental e chapéu; confirmar que a view 14 só é usada como ajudante na cozinha e que a view normal regressa no final.
- [ ] Rever a viagem de Luís da Room 4 para a Room 6. Há dois caminhos de conclusão e estado `comPai` duplicado; Luís não deve desaparecer, duplicar-se ou ficar na Universidade.
- [ ] Alterar o `RealName` de `cVania` de `New character` para `Vânia` e confirmar view, posição, baseline e direção na Room 2.
- [ ] Decidir se a Room 5/Estação e `cRoger` entram nesta versão. Se não entrarem, deixá-los inacessíveis e fora do percurso publicado.
- [ ] Preencher descrições úteis para as Rooms 1–5, 10 e 20 no painel Rooms.

## Interações a validar no editor

- [ ] **Room 1:** impedir que olhar repetidamente para o copo volte a oferecer a palheta e que o sofá volte a criar Nerfs; confirmar os eventos de sofá, copo, palheta, partitura e tripé.
- [ ] **Room 3:** testar os alvos sobrepostos do lixo/caixote, a animação da funcionária, o saco limpo e a saída dos praxistas. Nenhum alvo invisível deve continuar clicável.
- [ ] **Room 4:** testar posições, scaling e baselines dos objetos; verificar save/load depois de cada combinação e garantir que itens consumidos não reaparecem.
- [ ] **Room 6:** confirmar os hotspots do banco, avental, chapéus, cozinha e saída, incluindo tentativas sem disfarce ou com apenas uma peça.
- [ ] **Room 7:** rever a sobreposição entre objetos e hotspots dos bolos, livro e ampulhetas; confirmar que todos os cliques chegam ao handler certo.
- [ ] **Room 7:** testar cobertura crua, nove minutos exatos e cobertura queimada; testar uma atribuição errada e a solução `A=Mariana, B=Tiago, C=Rita, D=Gabriel, E=Patrícia`.
- [ ] Confirmar que `iBirthdayCake` é entregue uma única vez.

## Teste integral

- [ ] Começar um jogo novo na Room 1 apenas com `iOboe`; não injetar itens por debug.
- [ ] Percorrer `1 → 2 → 10 → 3 → 4 → 6 → 7 → 20` e confirmar inventário, views e posições em cada transição.
- [ ] Guardar e carregar nas Rooms 1, 3, 4, 6, 7 e 20, incluindo durante os puzzles de várias etapas.
- [ ] Tentar ações fora da ordem correta para confirmar que nenhuma combinação bloqueia o progresso.
- [ ] Verificar textos, acentos, quebras de linha, legendas fora do ecrã e consistência de português europeu.
- [ ] Testar a verb coin, inventário, Escape, guardar, carregar, reiniciar, sair e voltar ao menu.
- [ ] Compilar novamente e confirmar que `warnings.log` fica vazio.

## Preparação do build

- [ ] Atualizar Developer Name, versão e Release Date em General Settings. O projeto está em `1.0.0.0`, mas existem pacotes antigos com o nome `0.1`.
- [ ] Gerar de novo os targets Windows, Linux e Web; não distribuir os ZIP antigos da raiz ou de `Compiled/`.
- [ ] Testar cada build fora do editor. No Linux, confirmar permissões executáveis e finais de linha do launcher.
- [ ] Fazer um teste limpo a partir do pacote final, não apenas pelo botão Run do AGS.
- [ ] Só depois do teste, criar o ZIP de distribuição, guardar o commit exato e marcar a versão no Git.

## Já confirmado no repositório

- `cGabriel.StartingRoom` é 1.
- O único item inicial é `iOboe`; `iKey` não é inicial.
- Todos os destinos usados por `ChangeRoom` existem.
- Todos os ficheiros-fonte de sprites referenciados existem.
- Os builds Windows, Linux e Web usam o mesmo ficheiro de dados do jogo.
- A compilação atual não tem erros; o único aviso conhecido é o movimento bloqueante da Room 1 descrito acima.
