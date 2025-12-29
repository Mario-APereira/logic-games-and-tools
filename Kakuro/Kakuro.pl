:- [codigo_comum].


%*****************************Excludes**************************
%verifica se um espaco e vazio, caso seja exclui
espaco_vazio(X):- flatten(X, Flist), length(Flist, Len), Len < 2.

%usado para excluir um espaco nao pretendido de uma lista
exclui_espaco(Esp, Y):- Y == Esp.

%usado para retirar todas as opcoes que nao unificam com o elemento X
nao_unifica(X,Y) :- not(X = Y).

% usado em escolhe_menos_alternativas para verificar se as
% Permutacoes Possiveis possuem mais do que uma permutacao possivel.
len_menor_2(Perm_poss):- nth1(2, Perm_poss, Perms), length(Perms, L), L < 2.

% usado em resolve_aux para verificar se o puzzle ja foi resolvido ou
% ainda nao tem solucao
exclui_perms_concluidas(Perm):- nth1(2, Perm, Perms), length(Perms, Len), Len < 2.
%***************************************************************


%*****************************includes**************************
%verifica se um espaco e vazio, caso seja exclui
pertence_lista(X, Y):- X == Y.
%***************************************************************



% combinacoes_soma recebe uma lista com numeros de 1 a 9(Els), um numero
% N e um numero soma. Combs sao as combinacoes N a N de
% numeros de 1 a 9 cuja soma dos elementos tera de ser igual a Soma.
combinacoes_soma(N, Els, Soma, Combs):- findall(Comb, (combinacao(N, Els, Comb), sumlist(Comb, L), L =:= Soma), Combs).


%permutacoes_soma resulta da utilizacao do predicado combinacoes_soma e
% devolve Perms (todas as permutacoes possiveis para todas as
% combinacoes possiveis).
permutacoes_soma(N, Els, Soma, Perms):- combinacoes_soma(N, Els, Soma, Combs),
    findall(L, (member(Comb, Combs), permutation(Comb, L)), Perms_aux),
    sort(Perms_aux, Perms).


% espacos_fila recebe uma fila e um carater H_V(h ou v) distinguindo se
% uma fila e horizontal ou vertical. Devolve todos uma lista com todos
% os espacos dessa fila (Espacos).
espacos_fila(H_V, Fila, Espacos):- altera_fila(Fila, H_V, [], [], New_fila),
    exclude(espaco_vazio, New_fila, New_fila2),
    maplist(reverse, New_fila2, New_fila3),
    maplist(cria_espacos, New_fila3, New_fila4),
    reverse(New_fila4, Espacos), !.


% predicado auxiliar de espacos_fila usado no maplist para
% tornar os espacos em estruturas do tipo 'espaco(Soma,Variaveis)'.
cria_espacos([Soma|Lista], Espaco):- Espaco = espaco(Soma, Lista).


% predicado auxiliar de espacos_fila que transforma uma fila em varias
% listas de variaveis em que cada lista o ultimo elemento e o numero
% correspondente a soma do espaco. Exemplo: [_5716, _5710, _5704, 9].
altera_fila([], _, Temp, Res, [Temp|Res]).

altera_fila([El|Fila], H_V, Temp, Res, New_fila):- nonvar(El), /*Se o elemento for uma variavel e a fila horizontal*/
    H_V == h, nth1(2, El, El2), altera_fila(Fila, H_V, [El2], [Temp|Res], New_fila).

altera_fila([El|Fila], H_V, Temp, Res, New_fila):- nonvar(El),/*Se o elemento for uma variavel e a fila vertical*/
    H_V == v, nth1(1, El, El2), altera_fila(Fila, H_V, [El2], [Temp|Res], New_fila).

altera_fila([El|Fila], H_V, Temp, Res, New_fila):- var(El), /*Se o elemento nao for uma variavel*/
     altera_fila(Fila, H_V, [El|Temp], Res, New_fila).


% espaco_fila semelhante ao espacos_fila mas devolve os espacos membro a
% membro em vez de devolver a lista inteira.
espaco_fila(Fila, Esp, H_V):- espacos_fila(H_V, Fila, Espacos),
    member(Esp, Espacos).


% espacos_puzzle recebe um puzzle(Puzzle) e devolve uma lista(Espacos)
% com todos os espacos desse puzzle ordenados conforme o enunciado.
espacos_puzzle(Puzzle, Espacos):- esp_puzzle_aux(Puzzle, h, [], Fila1), mat_transposta(Puzzle, PuzzleT),
    esp_puzzle_aux(PuzzleT, v, [], Fila2),/*usado novamento para obter os espacos verticais do puzzle*/
    reverse(Fila1, [_|Esps1]),
    reverse(Fila2, [_|Esps2]),
    append(Esps1, Esps2, Esps3),
    flatten(Esps3, Espacos).

% predicado auxiliar do espacoas_puzzle que recebe todas as filas
% horizontais ou verticais do puzzle e devolve uma lista revertida com
% todos os espacos de todas as filas
esp_puzzle_aux([], _, Esps, Esps).
esp_puzzle_aux([Fila|Puzzle], H_V, Res, Esps):- espacos_fila(H_V, Fila, Espacos),
    esp_puzzle_aux(Puzzle, H_V, [Espacos|Res], Esps).


% espacos_com_posicoes_comuns recebe uma lista de espacos(Espacos) e um
% espaco(Esp) e devolve uma lista com todos os espacos com variaveis
% comuns ao espaco Esp.
espacos_com_posicoes_comuns(Espacos, Esp, Esps_com):- Esp = espaco(_, Variaveis),
    exclude(exclui_espaco(Esp), Espacos, Espacos1), /*explicacao nos excludes*/
    posicoes_comuns_aux(Espacos1, Variaveis, [], Espacos2),
    flatten(Espacos2, Espacos3),
    reverse(Espacos3, Esps_com).

% predicado auxiliar a espacos_com_posicoes_comuns que a cada espaco de
% Espacos verifica se tem alguma variavel em comum com Esp.
posicoes_comuns_aux([], _, Res, Res).
posicoes_comuns_aux([Espaco|Espacos], Variaveis, Res, Esps_com):- testa_comuns(Variaveis, Espaco, [], Lista),
    posicoes_comuns_aux(Espacos, Variaveis, [Lista|Res], Esps_com).


% predicado auxiliar usado no posicoes_comuns_aux, o qual verifica se um
% espaco possui alguma variavel em comum com o espaco(Esp) fornecido em
% espacos_com_posicoes_comuns.
testa_comuns([], _, Res, Res).

testa_comuns([X|Variaveis], Espaco, Res, Lista):- Espaco = espaco(_, Vars),/*caso em que possui uma variavel em comum com Esp*/
    include(pertence_lista(X), Vars, Vars2),
    length(Vars2, Len), Len > 0,
    testa_comuns(Variaveis, Espaco, [Espaco|Res], Lista), !.

testa_comuns([X|Variaveis], Espaco, Res, Lista):- Espaco = espaco(_, Vars),/*caso em que nao possui uma variavel em comum com Esp*/
    include(pertence_lista(X), Vars, Vars2),
    length(Vars2, Len), Len =:= 0,
    testa_comuns(Variaveis, Espaco, Res, Lista).

% permutacoes_soma_espacos recebe uma lista de estruturas 'espaco(Soma,
% Variaveis)' e devolve uma lista de listas em que cada uma tem um
% espaco e as permutacoes N a N correspondidas a Soma do espaco com N o
% numero de variaveis do espaco.
permutacoes_soma_espacos(Espacos, Perms_soma):- maplist(perms_soma_esps_aux, Espacos, Perms_soma).

% predicado auxiliar usado no maplist de permutacoes_soma_espacos que
% transforma cada espaco em uma lista do tipo [espaco, permutacoes].
perms_soma_esps_aux(Espacos, Perms_soma):- Espacos = espaco(Soma, Variaveis),
    length(Variaveis, Len),
    permutacoes_soma(Len, [1,2,3,4,5,6,7,8,9], Soma, Perms),
    Perms_soma = [Espacos, Perms].

% permutacao_possivel_espaco recebe um espaco(Esp), uma lista de
% espacos(Espacos) e uma lista de permutacoes e espacos(Perms_soma) e
% devolve uma permutacao possivel para o espaco fornecido.
permutacao_possivel_espaco(Perm, Esp, Espacos, Perms_soma):- permutacao_possivel_lista(Lista_final, Esp, Espacos, Perms_soma),
    member(Perm, Lista_final).

%predicado auxiliar de permutacao_possivel_espaco e de permutacoes_possiveis_espaco
% que recebe um espaco(Esp) e uma lista de espacos(Espacos) e devolve
% uma Bag que corresponde a uma lista com todas a permutacoes possiveis
% para o espaco Esp.
permutacao_possivel_lista(Bag, Esp, Espacos, _):- espacos_com_posicoes_comuns(Espacos, Esp, Esps_comuns),
    permutacoes_soma_espacos(Esps_comuns, Perms_comuns_soma),
    maplist(espacos_em_variaveis_com_permutacoes, Perms_comuns_soma, Lst_perms),
    permutacoes_soma_espacos([Esp], [Perms_esp|_]),
    Perms_esp = [espaco(_, Vars), Perms],
    exclude(nao_unifica(Vars), Perms, Perms_possiveis),
    findall(Perm, (member(Perm, Perms_possiveis), possivel_aux(Vars, Lst_perms,[], Perm, _)), Bag).

% predicado auxiliar de permutacao_possivel_lista que recebe as
% variaveis de Esp, uma lista de variaveis e permutacoes de todos os
% espacos comuns(Lst_perms) e uma permutacao ainda a verificar se e
% possivel para o espaco Esp(Perm). Se devolver um resultado(Res) entao
% essa permutacao e possivel para o espaco.
possivel_aux(_, [], Res, _, Res).
possivel_aux([Var|Vars], [Lst|Lst_perms], Res1, [Valor|Perm], Res2):- Lst = [Lst_vars, Perms],
    descobre_posicao(Var, Lst_vars, 1, Pos),
    length(Lst_vars, Len),
    length(Vars_teste, Len),
    nth1(Pos, Vars_teste, Valor),
    exclude(nao_unifica(Vars_teste), Perms, Perms_res),
    Perms_res \== [],
    possivel_aux(Vars, Lst_perms, [Valor|Res1], Perm, Res2).

% predicado auxiliar que recebe uma variavel(Var) e uma lista de
% variaveis(Lst) e descobre a posicao de Var na Lista Lst em funcao de
% nth1.
descobre_posicao(Var, [Var|_], N, Pos):- Pos = N, !.
descobre_posicao(Var, [El|Lst], N, Pos):- Var \== El,
    N1 is N + 1,
    descobre_posicao(Var, Lst, N1, Pos), !.


% usado no maplist em permutacao_possivel_lista que recebe uma lista de
% espacos em formato de permutacoes_soma_espacos e devolve uma lista com
% todos os espacos modificados para uma lista com apenas as variaveis e
% as permutacoes possiveis para esse espaco.
espacos_em_variaveis_com_permutacoes(Espaco, Vars_e_Perm):- Espaco = [espaco(_, Vars), Perms],
    Vars_e_Perm = [Vars, Perms].

% permutacoes_possiveis_espaco recebe uma lista de espacos(Espacos),
% Perms_soma respetiva dos Espacos e um espaco(Esp) e devolve
% Perms_poss: uma lista com as variaveis de Esp e com uma lista de todas
% as permutacoes possiveis para esse dado espaco.
permutacoes_possiveis_espaco(Espacos, Perms_soma, Esp, Perms_poss):-
    permutacao_possivel_lista(Lista_final, Esp, Espacos, Perms_soma),
    Esp = espaco(_, Variaveis),
    Perms_poss = [Variaveis, Lista_final].

% permutacoes_possiveis_espacos aplica o predicado
% permutacoes_possiveis_espaco a todos os espacos de Espacos e devolve a
% lista resultante em Perms_poss_esps.
permutacoes_possiveis_espacos(Espacos, Perms_poss_esps):-
    maplist(permutacoes_possiveis_espaco(Espacos, _), Espacos, Perms_poss_esps).


% numeros_comuns recebe uma lista de listas com numeros(Lst_Perms) e
% devolve uma lista(Numeros_comuns) com os numeros repetidos na mesma posicao para
% todas a listas de Lst_Perms. Cada elemento da lista Numeros_comuns e
% uma par ordenado com (Posicao, Numero)
numeros_comuns(Lst_Perms, Numeros_comuns):- nth1(1, Lst_Perms, L),
    length(L, Len),
    Len2 is Len + 1,
    numeros_comuns_aux(Lst_Perms, 1, Len2, [], Lista), reverse(Lista, Numeros_comuns), !.


% predicado auxiliar a numeros_comuns que recebe a lista de listas
% Lst_Perms e o comprimento de cada lista e que vai devolver a lista
% revertida com os numeros comuns em posicoes comuns.
numeros_comuns_aux(_, N, N, Res, Res).

numeros_comuns_aux(Lst_Perms, N, Len, Res, Numeros_comuns):- findall(El, (member(Perm, Lst_Perms), nth1(N, Perm, El)), Bag),
    nth1(1, Bag, Cmp), subtract(Bag, [Cmp], List), length(List, L), L =:= 0, N_act is N + 1, /*caso de existir um numero comum*/
    numeros_comuns_aux(Lst_Perms, N_act, Len, [(N, Cmp)|Res], Numeros_comuns).

numeros_comuns_aux(Lst_Perms, N, Len, Res, Numeros_comuns):- findall(El, (member(Perm, Lst_Perms), nth1(N, Perm, El)), Bag),
    nth1(1, Bag, Cmp), subtract(Bag, [Cmp], List), length(List, L), L > 0, N_act is N + 1,/*caso de nao existir um numero comum*/
    numeros_comuns_aux(Lst_Perms, N_act, Len, Res, Numeros_comuns).


% atribui_comuns recebe uma lista de permutacoes possiveis e devolve a
% mesma lista mas com os numeros comuns atribuidos as variaveis com a
% mesma posicao que esses numeros comuns.
atribui_comuns(Perms_Possiveis):- maplist(atribui_comuns_aux, Perms_Possiveis, Res),
    Perms_Possiveis = Res, !.

% predicado de atribui_comuns que se uma variavel nao tiver numeros
% comuns mantem-se e se tiver atribui esse numero a essas variaveis
atribui_comuns_aux(X, Y):- nth1(1, X, Vars), nth1(2, X, Lst_Perms),
    numeros_comuns(Lst_Perms, N_comuns),                              /*caso que existem numeros comuns*/
    length(N_comuns, Len), Len > 0, atribui_vars(Vars, N_comuns, Res), Y = [Res, Lst_Perms].

atribui_comuns_aux(X, Y):-nth1(2, X, Lst_Perms), numeros_comuns(Lst_Perms, N_comuns),/*caso que nao existem numeros comuns*/
    length(N_comuns, Len), Len =:= 0, Y = X.

% predicado auxiliar que atribui os valores comuns as variaveis
% correspondentes a essas posicoes.
atribui_vars(Res, [], Res).
atribui_vars(Vars, [Comum|N_comuns], Res):- Comum = (Lugar, Valor), nth1(Lugar, Vars, Valor),
    atribui_vars(Vars, N_comuns, Res).


% retira_impossiveis vai retirar todas as permutacoes a lista
% Perms_Possiveis que nao sao possiveis devido aos numeros comuns
% atribuidos e devolve essa lista em Novas_Perms_Possiveis.
retira_impossiveis(Perms_Possiveis, Novas_Perms_Possiveis):- maplist(retira_aux, Perms_Possiveis, Novas_Perms_Possiveis).

% predicado auxiliar a retira_impossiveis que retira a todos os
% elementos da lista as permutacoes que nao sao possiveis.
retira_aux(Perms_possiveis, Novas_Perms_Possiveis):- Perms_possiveis = [Vars, Perms],
    exclude(nao_unifica(Vars), Perms, Lst_possiveis),
    Novas_Perms_Possiveis = [Vars, Lst_possiveis].


% simplifica, predicado que recebe Perms_Possiveis(lista de permutacoes
% possiveis) e devolve uma lista de permutacoes possiveis apos serem
% aplicados os predicados atribuis_comuns e retira_impossiveis
% sucessivamente ate nao haver mais alteracoes possiveis na lista.
simplifica(Perms_Possiveis, Novas_Perms_Possiveis):- atribui_comuns(Perms_Possiveis),
    retira_impossiveis(Perms_Possiveis, Perms_Possiveis2),
    Perms_Possiveis == Perms_Possiveis2,
    Novas_Perms_Possiveis = Perms_Possiveis2, !. /*caso em que ja nao ha alteracao possivel*/

simplifica(Perms_Possiveis, Novas_Perms_Possiveis):-atribui_comuns(Perms_Possiveis),
    retira_impossiveis(Perms_Possiveis, Perms_Possiveis2), /*caso em que e possivel alterar ainda a lista*/
    Perms_Possiveis \== Perms_Possiveis2,
    simplifica(Perms_Possiveis2, Novas_Perms_Possiveis).


% incializa recebe uma puzzle e vai retornar uma lista de permutacoes
% possiveis(Perms_Possiveis) apos ser modificada pelo simplifica ate
% nao houver alteracao nenhuma, podendo chegar mesmo a resolver logo o
% puzzle.
inicializa(Puzzle, Perms_Possiveis):- espacos_puzzle(Puzzle, Espacos),
permutacoes_possiveis_espacos(Espacos, Perms_Possiveis_espacos),
simplifica(Perms_Possiveis_espacos, Perms_Possiveis).


% escolha_menos_alternativas recebe uma lista de permutacoes
% possiveis(Perms_Possiveis), em que escolhe devolve uma
% permutacao(Escolha) para atribuir as variaveis quando o simplifica ja
% nao e capaz de simplificar mais. Se Perms_Possiveis tiver apenas
% vetores unitarios o predicado devolve false.
escolhe_menos_alternativas(Perms_Possiveis, _):- exclude(len_menor_2, Perms_Possiveis, Perms_Possiveis_2),
    Perms_Possiveis_2 == [], fail.

escolhe_menos_alternativas(Perms_Possiveis, Escolha):-
    exclude(len_menor_2, Perms_Possiveis, Perms_Possiveis_2),/*caso em que atribui uma escolha as variaveis*/
    Perms_Possiveis_2 \== [],
    descobre_posicao_min(Perms_Possiveis_2, Pos),
    nth1(Pos, Perms_Possiveis_2, Escolha).

% predicado auxliar a esolhe_menos_alternativas que tem como funcao
% principal escolher a primeira permutacao que encontrar da lista de
% permutacoes mais pequena de Perms_Possiveis.
descobre_posicao_min(Perms_Possiveis, Pos):- maplist(nth1(2), Perms_Possiveis, Perms),
    maplist(length, Perms, Lst_lens),
    min_member(Min, Lst_lens),
    nth1(Pos, Lst_lens, Min), !.

% experimenta_perm vai atribuir as variaveis de uma permutacao possivel
% a permutacao que o predicado escolhe_menos_alternativas
% escolheu(Escolha). Devolve Novas_Perms_Possiveis que e a nova lista de
% permutacoes possiveis mas agora ja com a escolha atribuida as suas
% variaveis respetivas
experimenta_perm(Escolha, Perms_Possiveis, Novas_Perms_Possiveis2):- Escolha = [Esp, Lst_Perms],
    member(Perm, Lst_Perms),
    Esp = Perm,
    susbtitui_elemento(Perms_Possiveis, Escolha, [Esp, [Perm]], [], Novas_Perms_Possiveis),
    reverse(Novas_Perms_Possiveis, Novas_Perms_Possiveis2).

% predicado auxiliar de experimenta_perm que substitui as variaveis pela
% permutacao escolhida pelo escolhe_menos_alternativas.
susbtitui_elemento([], _, _, Res, Res).
susbtitui_elemento([Perm|Perms_Possiveis], Escolha, Subst, Res, Novas_Perms_Possiveis):-
    Perm == Escolha,                                                                     /*caso em que encontra o lugar da escolha*/
    susbtitui_elemento(Perms_Possiveis, Escolha, Subst, [Subst|Res], Novas_Perms_Possiveis).

susbtitui_elemento([Perm|Perms_Possiveis], Escolha, Subst, Res, Novas_Perms_Possiveis):-
    Perm \== Escolha,                                                             /*caso em que nao encontra o lugar da escolha*/
    susbtitui_elemento(Perms_Possiveis, Escolha, Subst, [Perm|Res], Novas_Perms_Possiveis).



% resolve_aux recebe Perms_Possiveis uma lista de permutacoes possiveis
% e vai tentar simplificar na totalidade exprimentando permutacoes com o
% experimenta_perm e posteriormente simplificando com o
% simplifica. Se uma Escolha nao resulta entao volta ao member de experimenta_perm e
% exprimenta outa permutacao ate encontrar solucao.
resolve_aux(Perms_Possiveis, Novas_Perms_Possiveis):-
    exclude(exclui_perms_concluidas, Perms_Possiveis, Teste),/*caso em que foi possivel resolver o puzzle*/
    Teste == [], Novas_Perms_Possiveis = Perms_Possiveis.

resolve_aux(Perms_Possiveis, Novas_Perms_Possiveis):- exclude(exclui_perms_concluidas, Perms_Possiveis, Teste),
    Teste \== [], escolhe_menos_alternativas(Perms_Possiveis, Escolha),
    experimenta_perm(Escolha, Perms_Possiveis, Perms_Possiveis2),/*caso em que nao foi possivel resolver o puzzle e*/
    simplifica(Perms_Possiveis2, Res),                           /*exprimenta uma nova Escolha para Perms_Possiveis*/
    resolve_aux(Res, Novas_Perms_Possiveis).


% predicado principal que recebe um puzzle(Puz) e vai retornar o puzzle
% ja resolvido com a respetiva solucao
resolve(Puz):- inicializa(Puz, Perms_Possiveis), resolve_aux(Perms_Possiveis, _).
