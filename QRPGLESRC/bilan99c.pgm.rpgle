**free
      //%METADATA                                                      *
      // %TEXT Bilan avant projet intermédiaire - Exercice 3           *
      //%EMETADATA                                                     *
// 1. Déclarer une structure de données CMDART, qualifiée, et composée de 3 sous-zones :
//     - NUMART de type numérique étendu de longueur 6
//     - QUANTITE de type numérique étendu de longueur 2
//     - PRIX de type numérique étendu de longueur 7 dont 2 décimales
dcl-ds cmdart qualified;
  numart zoned(6);
  quantite zoned(2);
  prix zoned(7:2);
end-ds;

// 2. Déclarer la variable TOTAL de type numérique étendu de longueur 9 dont 2 décimales
dcl-s total zoned(9:2);

// 3. Déclarer la variable MSG de type alphanumérique variable de longueur 52
dcl-s msg varchar(52);

// 4. Affecter à NUMART la valeur de 12345
cmdart.numart = 12345;

// 5. Affecter à PRIX la valeur de 100 euros et 99 centimes
cmdart.prix = 100.99;

// 6. Affecter à QUANTITE la valeur de 10
cmdart.quantite = 10;

// 7. Affecter à TOTAL la valeur du prix multiplié par la quantité
total = cmdart.prix * cmdart.quantite;

// 8. Affecter à MSG ce qu'il faut pour obtenir : Article 12345 - Total : 1009.90
msg = 'Article ' + %char(cmdart.numart) + ' - Total : ' + %char(total);
// 9. Afficher par DSPLY la valeur de MSG
dsply msg;
// 10. Terminer le programme et sortir sans libérer la mémoire
return;
