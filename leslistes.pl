/*les listes en prolog */

afficheListe([X|Y]):- write(X),nl,write(Y).
sommeListe([X|Y]):-N is X+Y,nl,write(N).

/*somme d'une liste � plusieurs �l�ments*
sum([],0):-!. /*affiche zero si liste vide)*/
sum([T|Q], R1):-
    sum(Q,R),
    R1 is T+R.

afficheSom():-
    sum([1|[3,4,5]],R1),
    write(R1).
