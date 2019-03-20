%fatoriel(0,1):-!.
factoriel(1,1):-!.
factoriel(N,R):-
    N1 is N-1,
    factoriel(N1,R1),
    R is R1*N.

/*Conversion en masjuscule*/
conversion:-
    writeln("Entrer le Caractere"),
    read(C),
    downcase_atom(C, Result),
    write(Result).

/*ECRITURE DANS UN FICHIER*/
ecriturefichier(Nometudiant liste):-
