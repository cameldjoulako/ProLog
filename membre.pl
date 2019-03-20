membre(X,[]):-false.
membre(X,[T|Q]):-
    X=T;
    membre(X,Q).
