affiche_bonjour2:-write('Bonjour IN3'),nl,write('I like prolog').

/*Declaration des faits*/
garcon(huges).
fille(laura).
garcon(paved).
fille(kelly).
pere(nyangona).
mere(katino).
pere(elie).
pere(stephan).
soeur(kelly, paved).
epouse(katino,nyangono).
fils(paved,nyangono).pere(elie, hugues).
frere(stephan, hugues).
fille(X,Y):-soeur(X,Z),fils(Z,Y).
/*enfant(X,Y):-soeur(X,Y),fils(Z,Y),epouse(Y,T),fils(X,T).*/

pere(jean,jules).
pere(elie,hugues).
pere(elie,kelly).
pere(nyangono,paved).
