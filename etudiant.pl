/*ECRITURE DANS UN FICHIER et v�rification dans la base de donn�es*/
verifetudiant:-
    write("Nom de l'etudiant: "),
    read(Nom_etud),
    consult("D:/MesProjets/ProLog/etudiant.pl"),
    etudiant(Nom_etud).


ajoutetudiant:-
    writeln('Entrer le nom a jout�: '),nl,
    read(Nom),
    open("D:/MesProjets/ProLog/etudiant.pl", append, Fichier),
    write(Fichier, "etudiant("),
    write(Fichier, Nom),
    write(Fichier, ")."),
    close(Fichier).


/*les faits*/
etudiant(camel).
etudiant(leonce).
etudiant(leonne).