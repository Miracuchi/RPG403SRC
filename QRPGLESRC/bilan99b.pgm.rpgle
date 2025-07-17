**free
      //%METADATA                                                      *
      // %TEXT Bilan avant projet intermédiaire - Exercice 2           *
      //%EMETADATA                                                     *
// 1. Déclarer le fichier EMPLOYES en lecture + écriture
dcl-f employes usage(*input:*output) rename(employes:empfmt);
dcl-s i int(3);
// 2. Ajouter un 1er employé dans le fichier EMPLOYES :
//     a. Affecter les valeurs que vous voulez aux matricule, nom, prénom et salaire
matricule = 123456;
nom = 'Dorvilmag';
prenom = 'Dylang';
salaire = 75000;

//     b. Ajouter ce 1er employé
write empfmt;


// 3. Ajouter un 2nd employé dans le fichier EMPLOYES :
//     a. Affecter les valeurs que vous voulez aux matricule, nom, prénom et salaire
//     mais différentes du 1er employé
matricule = 789123;
nom = 'Dorvilmag';
prenom = 'Dylang';
salaire = 52000;
//     b. Ajoutez ce 2nd employé
write empfmt;
// 4. Faire une boucle qui permettra de lire tous les employés
//     et d'afficher leur matricule, nom, prénom et salaire
setll *start employes;
read employes;
dow not %eof;
  dsply %char(matricule);
  dsply %char(nom);
  dsply %char(prenom);
  dsply %char(salaire);
  read employes;
enddo;

// 5. Terminer le programme et sortir en libérant la mémoire
*inlr = *on;
