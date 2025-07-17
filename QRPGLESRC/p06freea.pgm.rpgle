**free
      //%METADATA                                                      *
      // %TEXT Ex06A : Mise en pratique de l algorithmie               *
      //%EMETADATA                                                     *
dcl-s nombre1 int(5);
dcl-s nombre2 int(5);
dcl-s resultat varchar(30);
dcl-s message varchar(30);

message = 'Premier nombre ?';
dsply message '*EXT' nombre1;

message = 'Deuxième nombre ?';
dsply message '*EXT' nombre2;

SELECT;
WHEN (nombre1 > 0 and nombre2 > 0) or (nombre1 < 0 and nombre2 < 0);
    // Insérer ici le bloc conditionnel
    resultat = 'Produit positif';
WHEN (nombre1 > 0 and nombre2 < 0) or (nombre1 < 0 and nombre2 > 0);
    // Insérer ici le bloc conditionnel
    resultat = ' Produit négatif';
other;
    resultat = ' Produit nul';
// Insérer plus de blocs WHEN ici
ENDSL;

dsply resultat;

*inlr = *on;
