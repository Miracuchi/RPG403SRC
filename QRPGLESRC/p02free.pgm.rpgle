**free
      //%METADATA                                                      *
      // %TEXT Exercice 02  Déclaration de constantes et variabl      *
      //%EMETADATA                                                     *
dcl-c cours_libelle 'Formation RPG sous IBM i';
dcl-s article_numero int(3);
dcl-s artcile_prix zoned(7:2) inz(19.99);
dcl-s date_commande date(*eur);
article_numero = 100;
// zone de traitement
dsply cours_libelle;
dsply article_numero;
dsply artcile_prix;
// dsply %char(artcile_prix);
dsply date_commande;

*inlr = *on;
