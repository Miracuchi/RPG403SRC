**free
      //%METADATA                                                      *
      // %TEXT Bilan avant projet intermédiaire - Exercice 1           *
      //%EMETADATA                                                     *
// 1. Déclarer la variable TODAY de type DATE

dcl-s today date;

// 2. Déclarer la variable QUANTITE de type numérique étendu de longueur 2
dcl-s quantite zoned(2);

// 3. Déclarer la variable PRIX de type numérique étendu de longueur 7 dont 2 décimales
dcl-s prix zoned(7:2);

// 4. Déclarer la variable TOTAL de type numérique étendu de longueur 9 dont 2 décimales
dcl-s total zoned(9:2);

// 5. Déclarer la variable BILAN de type alphanumérique de longueur 20
dcl-s bilan char(20) inz('Bilan du aaaa-mm-jj');
//    initialisée à 'Bilan du aaaa-mm-jj'

// 6. Déclarer la variable CPT de type entier de longueur 3
dcl-s cpt int(3);

// 7. Affecter à TODAY la valeur de la date du jour
today = date();

// 8. Afficher par DSPLY la valeur de TODAY
dsply today;

// 9. Affecter à PRIX la valeur de 100 euros et 99 centimes
prix = 100.99;

// 10. Affecter à QUANTITE la valeur 10
quantite = 10;

// 11. Affecter à TOTAL la valeur du prix multiplié par la quantité
total = prix * quantite;

// 12. Afficher par DSPLY la valeur de TOTAL (vous devriez obtenir 1009.90)
dsply total;

// 13. Tester si TOTAL est supérieur à 1000 et dans ce cas afficher par DSPLY 'Total > 1000'
//     sinon afficher 'Total <= 1000'

if total > 1000;
 dsply 'Total > 1000';
 else;
  dsply 'Total <= 1000';
endif;
// 14. Remplacer dans BILAN la chaîne 'aaaa-mm-jj' par la valeur de TODAY
bilan = %scanrpl('aaaa-mm-jj':%trim(%char(today)):bilan);
// 15. Afficher par DSPLY la valeur de BILAN
dsply bilan;
// 16. Faire une boucle qui va afficher par DSPLY le premier caractère de BILAN
//     puis le second, puis le troisième

// 17. Terminer le programme et sortir sans libérer la mémoire
return;
