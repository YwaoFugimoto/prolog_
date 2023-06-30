pai(luiz,andre).
pai(luiz,paula).
pai(andre,ivo).
pai(igor,ari).
pai(igor,joana).
pai(igor,edu).
pai(ari,julia).
pai(edu,dudu).
pai(leo,ryan).

mae(lara,andre).
mae(lara,paula).
mae(paula,julia).
mae(isa,ivo).
mae(julia,ryan).
mae(ana,dudu).
mae(luiza,ari).
mae(luiza,joana).
mae(luiza,edu).  

tio(X,Y):- mae(W,X), mae(W,Z), mae(Z, Y), X \== Z. 
tio(X,Y):- pai(W,X), pai(W,Z), pai(Z, Y), X \== Z.

primo(X,Y):- mae(W,X), tio(W,Y).
primo(X,Y):- pai(W,X), tio(W,Y).

neto(X,Y):- pai(W,X), pai(Y,W).
neto(X,Y):- mae(W,X), mae(Y,W).
neto(X,Y):- mae(W,X), pai(Y,W).
neto(X,Y):- pai(W,X), mae(Y,W).

bisneto(X,Y):- neto(X,W), pai(Y,W).
bisneto(X,Y):- neto(X,W), mae(Y,W).
