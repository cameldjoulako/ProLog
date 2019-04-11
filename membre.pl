membre(X,[X|_]):-!.
membre(X,[_|Q]):-
    membre(X,Q).
