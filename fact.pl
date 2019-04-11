fact(0, 1).
fact(1,1).
fact(X,Y):-
    fact(Z,T),
    X is Z+1,
    Y is T*X.
