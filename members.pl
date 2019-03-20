membre(X,[T|Q]):-
    X=Q;
membre(X,Q).
    membre(X,[]):-false.
