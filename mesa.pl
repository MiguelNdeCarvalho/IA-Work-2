%dominio
pessoas(['Maria', 'Manuel', 'Madalena', 'Joaquim', 'Ana', 
'Julio','Matilde', 'Gabriel']).

%estado_inicial
estado_inicial(e([
          v(c(1),L,_),
          v(c(2),L,_),
          v(c(3),L,_),
          v(c(4),L,_),
          v(c(5),L,_),
          v(c(6),L,_),
          v(c(7),L,_),
          v(c(8),L,_)], [])) :- pessoas(L).

%restricoes
restricoes([esq('Manuel','Maria'), 
            frente('Joaquim','Maria'),
            lado('Joaquim', 'Matilde'), 
            cabeceira('Gabriel')]).

ve_restricoes(e(Nafec,Afect)):- \+ (member(v(c(I),Di,Vi), Afect),
                                member(v(c(J),Dj,Vj),Afect),  
                                I \=J),
                                restric(I,Vi,J,Vj).

restric(I,X,J,Y) :- restricoes(L), member(esq(X,Y),L), \+ (I is J+1; (I=1,J=8)).
restric(I,X,J,Y) :- restricoes(L), member(dir(X,Y),L), \+ (I is J-1; (I=8,J=1)).
restric(I,X,J,Y) :- restricoes(L), member(lado(X,Y),L), \+ (I is J-1; (I=8,J=1));
 (I is J+1; (I=1,J=8)).
restric(I,X,J,Y) :- restricoes(L), member(cabeceira(X),L), \+ (I is J+1; (I=1,J=8)).


%% escreve
esc(L):- sort(L,L1), write(L1), nl, esc1(L1).
esc1([]).
esc1([v(_,_,V)|R]):- esc(8,V,1),  esc1(R).
esc(V,V,V):- !,write(r),nl.
esc(V,N,V):- !,write('_'),nl.
esc(V,N,N):-!,write(r), M is N+1, esc(V,N,M).
esc(V,N1,N):-write('_'), M is N+1, esc(V,N1,M).