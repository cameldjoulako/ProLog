/*fusion  de 2 listes*/

/*Cas de base: liste vide et une autre liste non vide*/
fusionner([],L,L).

fusionner([T|X],Y,[T|Z]):-
    fusionner(X,Y,Z).
a
