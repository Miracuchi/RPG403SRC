      *%METADATA                                                       *
      * %TEXT Exercice 02  Déclaration de constantes et variabl       *
      *%EMETADATA                                                      *

     D cours_libelle   C                   'Formation RPG sous IBM i'
     D article_numero  S              3I 0
     D artcile_prix    C                   19.99
     D date_commande   S               D
       article_numero = 100;
       dsply cours_libelle;
       dsply article_numero;
       dsply artcile_prix;
       dsply date_commande;
       *inlr = *on;
