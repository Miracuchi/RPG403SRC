**free
      //%METADATA                                                      *
      // %TEXT Bilan avant projet intermédiaire - Exercice 4           *
      //%EMETADATA                                                     *
// 1. Déclarer un tableau TBL1 de 5 postes de type numérique étendu de longueur 2
dcl-s tbl1 zoned(2) dim(5);
// 2. Déclarer une variable Z1 identique à TBL1
dcl-s z1 like(tbl1);
// 3. Alimenter TBL1 avec les valeurs 8, 15, 7, 89 et 44
tbl(1) = 8;
tbl(2) = 15;
tbl(3) = 7;
tbl(4) = 89;
tbl(5) = 44;
// 4. Trier le tableau TBL1 dans l'ordre descendant
sorta(d) tbl1(*);
// 5. Faire une boucle qui va afficher par DSPLY chaque poste du tableau
for-each z1 in tbl1;
  dsply z1;
endfor;
// 6. Afficher par DSPLY le numéro du poste du tableau qui contient la valeur 15
dsply
// 7. Terminer le programme et sortir sans libérer la mémoire
