%estado_inicial

estado_inicial().


%variaveís


%dominio


%restricoes
restricoes([esq('Manuel','Maria'), 
            frente('Joaquim','Maria'),
            lado('Joaquim', 'Matilde'), 
            cabeceira('Gabriel')]).

%auxiliar
modDif(I,J,D):- I>J, D is I-J.
modDif(I,J,D):- I =< J, D is J-I.

%% escreve
esc(L):- sort(L,L1), write(L1), nl, esc1(L1).
esc1([]).
esc1([v(_,_,V)|R]):- esc(8,V,1),  esc1(R).
esc(V,V,V):- !,write(r),nl.
esc(V,N,V):- !,write('_'),nl.
esc(V,N,N):-!,write(r), M is N+1, esc(V,N,M).
esc(V,N1,N):-write('_'), M is N+1, esc(V,N1,M).