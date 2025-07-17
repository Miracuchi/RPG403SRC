**free
      //%METADATA                                                      *
      // %TEXT BILAN 03 - A                                            *
      //%EMETADATA                                                     *
dcl-s nom char(25);
dcl-s prenom char(15);
dcl-s salaire zoned(5);

nom = 'Dorvilma';
prenom = 'Dylan';
salaire = 2500;

dsply (nom + prenom + %char(salaire));

IF salaire < 3000;
salaire = salaire *1,1;
    // Insérer ici le bloc exécuté de manière conditionnelle
ENDIF;

dsply salaire;

dsply (salaire * 12);
*inlr = *on;
