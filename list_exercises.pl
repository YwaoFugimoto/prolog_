analisa_lista([X|Y]):-  write('A cabeca da lista eh : '), 
                        write(X),
                        write(' A cauda da lista eh: '),   
                        write(Y).
analisa_lista([]) :-  write('Lista').

comprimento(0,[]).
comprimento(X, [_|Y]):-
  comprimento(X1, Y), X is 1 + X1.

soma(0, []).
soma(X, [A|R]):-
  soma(X1, R), X is X1 + A.

%Ex3----------------------

troca([X|B], X ,Y, [Y|C]):- troca(B,X,Y,C), !.
troca([A|B], X, Y, [A|C]):-  A\==X, troca(B,X,Y,C), !.
troca([], _, _, []).

%Ex4----------------------

sub_conj([_|B], C) :- sub_conj(B,C).
sub_conj([A|B], [A|C]):- sub_conj(B,C).
sub_conj([],[]).

potencia(X,Y):- findall(L, sub_conj(X,L), Y).


%Ex5---------------------

mais_longa([_|B],[_|C]) :- mais_longa(B,C).
mais_longa([],[_|_]).

%Ex6----------------------------
distancia((A,B),(C,D), X) :- S is (C-A)*(C-A)+(D-B)*(D-B), X is 
sqrt(S).

%EX7------------
linha(0, _):- nl, !.
linha(N,C):- write(C), write(' '), N1 is N - 1, linha(N1, C), !.

quadro(0, _, _):- !.
quadro(N, M, C):- linha(M, C), N1 is N-1, quadro(N1,M,C), !.

quadrado(N, C):- quadro(N,N,C).

%EX8---------------------------------------

elemento_n([A|_],1,A):- !.
elemento_n([_|B], N, X):- N1 is N -1, elemento_n(B,N1,X).

%Ex9----------------------------------------------

soma_conta([], 0, 0).
soma_conta([A|B], S, C):- soma_conta(B, S1, C1), S is S1 + A,
C is C1 + 1 .
media(L,X) :- soma_conta(L,S,C), X is S/C.

%Ex10---------------------------------------
minimo([A], A):- !.
minimo([A|B], X):- minimo(B,C), (A<C -> X = A; X= C).

%Ex11-------------------
intervalo(A,A,[A]).
intervalo(I, F,[I|C]):- I < F, I1 is I + 1,
intervalo(I1, F,C).

%Ex13----------------------------------
ocorrencias(_,[],0):- !.
ocorrencias(X,[X|L], C):- ocorrencias(X,L,C1), C is C1 + 1, !.
ocorrencias(X,[_|L], C):- ocorrencias(X,L,C).

%Ex14--------------------------------
divisores(N, L):- findall(X,(between(1,N,X), N mod X =:= 0), L).
