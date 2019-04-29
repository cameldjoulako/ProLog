/*creerliste:-
write("Entrer le nombre des elements"),nl,
read(NbElement),

write("Entrer la tete de votre liste"),
read(Tete),
write("Entrer les autres element separé par une virgule"),
read(Fin),
[Tete|Fin],
write("Voici votre liste creer: "),
write(Tete),nl,write(Fin).*/


/*Insertion d'un élément dans une liste*/
ajoutElement(Elmt,1,Liste,[Elmt|Liste]).
ajoutElement(Elmt,Post,[Tete|Liste],[Tete|M]):-
    ajoutElement(Elmt,K,Liste, M),
Post is K+1.



liste:-read(L),creliste(L).
creliste(X):-write(X).
