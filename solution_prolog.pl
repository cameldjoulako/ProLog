% voici une correction du tp sur les listes en prolog
% pour vous aider a preparer le controle de TP. 
% ce fichier fonctionne tel quel, 
% si vous souhaitez le tester, le modifier etc. 

% ============================================================

%  LE PREDICAT appartient(X,L) 
% QUI EST VRAI LORSQUE L'ELEMENT X
% APPARTIENT A LA LISTE L 

% X appartient a une liste commencant par X
appartient(X,[X|L]).

% si X appartient a une liste L,
% alors X appartient a toute liste commencant par Y
% et suivi de L
% --- cette clause recouvre la precedente
% pour ne pas avoir plusieurs moyens d'obtenir 
% la reponse "yes" lors d'un appel appartient(toto,L)
% on peut rajouter Y\==X a cette clause. 
appartient(X,[Y|L]):- appartient(X,L).

% ============================================================

% LE PREDICAT non_appartient(X,L) 
% QUI EST VRAI LORSQUE L'ELEMENT X
% APPARTIENT A LA LISTE L 

% pour tout X 
% X n'appartient pas a la liste vide. 
non_appartient(X,[]).

% si X n'est pas Y
% et si X n'appartient pas a L
% alors X n'appartient pas a la liste de tete Y et de reste L
non_appartient(X,[Y|L]):-X\==Y,non_appartient(X,L).

% ============================================================

% LE PREDICAT sans_repetition(L)
% QUI EST VRAI LORSQUE L NE CONTIENT PAS DEUX OCCURENCES D'UN MEME ELEMENT

ex1([a,b,c]). 
ex2([a,b,a,a,c]). 

% la liste vide est sans repetition
sans_repetition([]).

% si X ne figure pas dans L
% et si L est sans repetition
% alors la liste de tete X et de reste L est sans repetition
sans_repetition([X|L]):-non_appartient(X,L),sans_repetition(L). 

% ============================================================

% LES PREDICATS SUIVANTS SONT EN FAIT DES FONCTIONS,
% C'EST A DIRE QUE LORSQUE TOUS LES ELEMENTS SONT FIXES SAUF 
% LE DERNIER IL N'Y A QU'UNE SEULE VALEUR 
% DU DERNIER ARGUMENT QUI RENDE LE PREDICAT VRAI. 

% ============================================================

% LE PREDICAT ajout_tete(X,L1,L2)
% QUI EST VRAI LORSQUE L2 EST LA LISTE OBTENUE A PARTIR 
% DE L1 PAR AJOUT DE X EN TETE DE L1 

% la liste [X|L] est le resultat de l'ajout 
% de X en tete de L
ajout_tete(X,L,[X|L]).

% ============================================================


% LE PREDICAT ajout_fin(X,L1,L2)
% QUI EST VRAI LORSQUE L2 
% EST LA LISTE OBTENUE A PARTIR DE L1
% PAR AJOUT DE X EN QUEUE DE L1

% la liste [X] est la liste obtenue par ajout de X
% en queue de la liste vide    
ajout_fin(X,[],[X]). 

% si l'ajout de X en queue de L1 donne la liste L3
% et si l'ajout en tete de Y a L3 donne L2
% alors L2 est la liste obtenue par ajout en queue de X 
% a la liste commencant par Y et de reste L1  
ajout_fin(X,[Y|L1],L2):-ajout_tete(Y,L3,L2), ajout_fin(X,L1,L3). 

% la clause precedent aurait pu etre ecrite:
% ajout_fin(X,[Y|L1],[Y|L2]):- ajout_fin(X,L1,L2). 

% ============================================================

% LE PREDICAT supprimer(X,L1,L2) 
% QUI EST VRAI LORSQUE L2 EST LA LISTE OBTENUE 
% PAR SUPPRESSION DE LA PREMIERE OCCURRENCE DE X 
% DANS L1 OU LORSQUE X NE FIGURE PAS DANS L1 ET QUE L2=L1

% la suppression de la premiere occurrence de X dans la liste vide 
% est la liste vide. 
supprimer(X,[],[]).

% la suppression de la premiere occurrence de X
% dans une liste commencant par X et de reste L1
% est L1 
supprimer(X,[X|L1],L1). 

% si X est different de Y 
% et si L3 est la liste obtenue en supprimant la premiere occurrence de X dans L1
% et si L2 est la liste obtenue par ajout en tete de Y a L1
% alors L2 est la liste obtenue par suppression de la premiere occurrence de X
% dans la liste commencant par Y et de reste L1 
supprimer(X,[Y|L1],L2):-X\==Y , ajout_tete(Y,L3,L2), supprimer(X,L1,L3). 

% ============================================================

% LE PREDICAT supprimer_fin(X,L) 
% QUI EST VRAI LORSQUE L EST LA LISTE L PRIVE DE SON DERNIER ELEMENT SI L EST NON VIDE
% OU LORSQUE L EST VIDE 

% la liste vide est la liste obtenue par suppression 
% du dernier element dans la liste vide
supprimer_fin([],[]).


% si L1 est la liste obtenue par ajout de Y en tete de L2
% et si L2 est la liste obtenue en supprimant le dernier element de L
% alors L1 est la liste commencant par Y et de reste L 
% privee de son dernier element 
supprimer_fin([Y|L],L1):- supprimer_fin(L,L2),ajout_tete(Y,L2,L1).

% ============================================================

% LE PREDICAT fusion(L1,L2,L3)
% QUI EST VRAI LORSQUE L3 EST OBTENUE A PARTIR DE L1 ET L2 
% EN PRENANT UN ELEMENT ALTERNATIVEMENT DANS L1 ET L2,
% ET EN ADJOIGNANT EN QUEUE LES ELEMENTS NON UTILISES D'UNE DES DEUX LISTES,
% S'IL EN RESTE (C.-A-D. LORSQUE LES DEUX LISTES NE SONT PAS DE MEME LONGUEUR)

% lorsque la seconde liste est vide,
% la liste fusion est la premiere liste. 
fusion(L1,[],L1).

% lorsque la premiere liste est vide
% la liste fusion est la seconde liste.
fusion([],L2,L2).

% si la fusion de L1 et L2 donne L5
% et si L4 est la liste de tete Y et de reste L5
% et si L3 est la liste de tete X et de reste L4
% alors L3 est la liste obtenue par fusion de L1 et L2 
fusion([X|L1],[Y|L2],L3):-ajout_tete(X,L4,L3),ajout_tete(Y,L5,L4), fusion(L1,L2,L5). 

% ============================================================

% LE PREDICAT concatener(L1,L2,L3) 
% QUI EST VRAI LORSQUE L3 EST LA LISTE DONT LES ELEMENTS SONT D'ABORD 
% CEUX DE L1 PUIS CEUX DE L2 

% la concatenation de la liste vide et de la liste L2 
% est la liste L2
concatener([],L2,L2).

% si L4 est la concatenation de l1 avec L2,
% et si L3 est la liste de tete X et de reste L4
% alors L3 est la concatenation de la liste de tete X et de reste L1 avec  L2
concatener([X|L1],L2,L3):-ajout_tete(X,L4,L3),concatener(L1,L2,L4). 

% on aurait pu ecire cette clause ainsi:
% concatener([X|L1],L2,[X|L3]):- concatener(L1,L2,L3). 

% ============================================================

% LE PREDICAT inverser(L1,L2)
% QUI EST VRAI LORSQUE L2 EST CONSTITUEE DES MEMES ELEMENTS 
% QUE L1 MAIS DANS L'ORDRE INVERSE.

% la liste inverse de la liste vide est la liste vide. 
inverser([],[]). 

% si la liste inverse de la liste L1 est la liste L3
% et si L2 est la liste obtenue par ajout de X en queue de L3
% alors L2 est la liste inverse de la liste de tete X et de reste L1
inverser([X|L1],L2):-inverser(L1,L3),ajout_fin(X,L3,L2). 

% ============================================================

% LE PREDICAT reunion(L1,L2,L3)
% QUI EST VRAI LORSQUE L1 ET L2 SONT SANS REPETITION 
% ET QUE L3 EST LA LISTE OBTENUE COMME SUIT:
% L3 CONTIENT LES ELEMENTS QUI FIGURENT DANS L1 OU DANS L2
% DANS L'ORDRE DE LEUR DERNIERE APPARITION DANS (L1 SUIVIE DE L2)
% --- UN ELEMENT COMMUN A L1 ET L2 NE FIGURE QU'UNE SEULE FOIS DANS L3 
% Question: pourquoi l'ordre des elements dans L3
% est-il celui que je donne? 

% La reunion de la liste vide et de L2 est L2
% --- qu'on suppose sans repetition 
reunion([],L2,L2). 

% si X figure dans L2 
% et si la reunion de L1 et L2 est L4
% alors L4 est la reunion de la liste de tete X et de reste L1 avec la liste L2
reunion([X|L1],L2,L4):-appartient(X,L2),reunion(L1,L2,L4). 

% si X ne figure pas dans L2
% et si la reunion de L1 avec L2 est L4 
% et si L3 est obtenue par ajout de X en tete de L4
% alors la reunion de la liste de tete X et de reste L1 avec la liste L2 
% est la liste L3 
% --- par hypothese, qui est preservee au cours des appels successifs,
% X ne figure pas dans L1: c'est pour cela qu'on obtient une liste sans repetition,
% meme s'il y a des elements communs. 
reunion([X|L1],L2,L3):-non_appartient(X,L2),  ajout_tete(X,L4,L3),reunion(L1,L2,L4).  

% on pourrait ajouter les clauses symetriques suivantes,
% qui sont vraies, mais non necessaires:
% avec les precedentes on finit toujours par arriver au cas reunion([],L2,L2). 
% Question: l'ajout de ces clauses conduit a plus de solutions,
% comment expliquez-vous cela ? 
% reunion(L1,[],L1).
% reunion(L1,[Y|L2],L4):-appartient(Y,L1),reunion(L1,L2,L4). 
% reunion(L1,[Y|L2],L3):-non_appartient(Y,L1) ajout_tete(Y,L4,L3),reunion(L1,L2,L4). 

% ============================================================

% LE PREDICAT commun(L1,L2,L3)
% QUI EST VRAI LORQUE L3 EST UNE LISTE SANS REPETITION 
% DES ELEMENTS COMMUNS A L1 ET L2
% LORSQUE CELLES-CI SONT SANS REPETITION. 
% L'ORDRE DES ELEMENTS DANS L3 EST L'ORDRE DE LEUR PREMIERE APPARITION
% DANS L1 SUIVIE DE L2. 

% si la premier liste est vide,
% l'intersection est la liste vide. 
commun([],L2,[]).

% si X appartient a L2 
% et si l'intersection de L1 et L2 est L4
% et si L3 est la liste obtenue par ajout de X en tete de L4 
% alors l'intersection de la liste de tete X et de reste L1 avec la liste L2
% est la liste L3 
commun([X|L1],L2,L3):- appartient(X,L2),commun(L1,L2,L4),ajout_tete(X,L4,L3).

% si X n'appartient a L2 
% et si l'intersection de L1 et L2 est L3
% alors l'intersection de la liste de tete X et de reste L1 avec la liste L2
% est aussi la liste L3 
commun([X|L1],L2,L3):- non_appartient(X,L2),commun(L1,L2,L3).



% comme precedemment on pourrait rajouter les clauses symetriques
  
% si X appartient a L2 
% et si l'intersection de L1 et L2 est L4
% et si L3 est laiste obtenue par ajout de X en tete de L4 
% alors l'intersection de la liste de tete X et de reste L1 avec la liste L2
% commun(L1,[],[]).
% commun(L1,[Y|L2],L3):-appartient(Y,L1),commun(L1,L2,L4),ajout_tete(Y,L4,L3).
% commun(L1,[Y|L2],L3):- non_appartient(Y,L1),commun(L1,L2,L3).


% ============================================================


% LE PREDICAT ens(L1,L2) 
% QUI EST VRAI LORSQUE L2 
% EST OBTENUE A PARTIR DE L1 
% PAR SUPPRESSION DE TOUTES LES OCCURRENCES D'UN ELEMENT SAUF LA DERNIERE:
% L2 EST TOUJOURS SANS REPETITION ET CONTIENT LES MEMES ELEMENTS

% la liste vide est la reduite de la liste vide
ens([],[]). 

% si X appartient a L1
% et que L2 est la reduite de L1
% alors L2 est la reduite de la liste de tete X et de reste L2 
ens([X|L1],L2):-appartient(X,L1),ens(L1,L2). 

% si X n'appartient pas a L1 
% et que L3 est la reduite de L1
% et que L2 est la liste de tete X et de reste L3 
% alors L2 est la reduite de la liste de tete X et de reste L1  
ens([X|L1],L2):-non_appartient(X,L1),ens(L1,L3),ajout_tete(X,L3,L2).  

% ===========================================================================

% LE PREDICAT reunionbis(L1,L2,L3) 
% QUI EST VRAI LORSQUE L3 EST LA LISTE OBTENUE COMME SUIT:
% L3 CONTIENT LES ELEMENTS QUI FIGURENT DANS L1 OU DANS L2
% DANS L'ORDRE DE LEUR DERNIERE APPARITION DANS (L1 SUIVIE DE L2)
% --- UN ELEMENT COMMUN A L1 ET L2 NE FIGURE QU'UNE SEULE FOIS DANS L3 
% CE PREDICAT NE RECQUIERT PAS QUE L1 ET L2 SOIENT SANS REPETITION 

% si L1ens est la liste reduite de L1,
% et si L2ens est la liste reduite de L2
% et si L3 est la reunion de L1ens et de L2ens (qui sont sans repetition) 
% alors L3 est la reunion de L1 et L2 (qui peuvent comporter des repetition)
% et L3 est sans repetition.
reunionbis(L1,L2,L3):-ens(L1,L1ens), ens(L2,L2ens), reunion(L1ens,L2ens,L3).



% on definit similairement un predicat communbis,
% variante de commun  
% qui fonctionne pour des listes avec repetition
% mais donne une liste sans repetition 
communbis(L1,L2,L3):-ens(L1,L1ens), ens(L2,L2ens), commun(L1ens,L2ens,L3).