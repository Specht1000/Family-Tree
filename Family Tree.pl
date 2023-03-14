parent(antonio,joazinho).
parent(antonio,luis).
parent(antonio,cristina).
parent(maria,joazinho).
parent(maria,luis).
parent(maria,cristina).
parent(carlos,antonio).
parent(carlos,alberto).
parent(carlos,marcia).
parent(fernanda,antonio).
parent(fernanda,alberto).
parent(fernanda,marcia).
parent(pedro,maria).
parent(mariana,maria).
parent(jose,mariana).
parent(sandra,mariana).

gender(joazinho,male).
gender(luis,male).
gender(cristina,female).
gender(antonio,male).
gender(alberto,male).
gender(marcia,female).
gender(carlos,male).
gender(fernanda,female).
gender(maria,female).
gender(pedro,male).
gender(mariana,female).
gender(jose,male).
gender(sandra,female).

father(X,Y) :- parent(X,Y), gender(X,male).
mother(X,Y) :- parent(X,Y), gender(X,female).
brother(X,Y) :- father(Z,X), father(Z,Y), gender(X,male), X\=Y. 
sister(X,Y) :- father(Z,X), father(Z,Y), gender(X,female),  X\=Y.
uncle(X,Y) :- ((father(L,Y), brother(X,L)) ; (mother(W,Y), brother(X,W))), gender(X,male), X\=Y. 
aunt(X,Y) :- ((father(L,Y), sister(X,L)) ; (mother(W,Y), sister(X,W))), gender(X,female), X\=Y.
grandfather(X,Y) :- (parent(X,Z), parent(Z,Y)), gender(X,male).
grandmother(X,Y) :- (parent(X,Z), parent(Z,Y)), gender(X,female).
greatgrandfather(X,A) :- (parent(X,Z), parent(Z,Y), parent(Y,A)), gender(X,male).
greatgrandmother(X,A) :- (parent(X,Z), parent(Z,Y), parente(Y,A)), gender(X,male).
ancestor(X,Y) :- parent(X,Y), X\= Y.
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y), X\=Y.
