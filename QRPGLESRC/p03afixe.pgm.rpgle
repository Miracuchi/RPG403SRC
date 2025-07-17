      *%METADATA                                                       *
      * %TEXT Exercice 03  Passage de paramètres                      *
      *%EMETADATA                                                      *
     D article_numero  S              3I 0
     D article_prix    S              7S 2 inz(19.99)
     C                   EVAL      article_numero = 100
     C                   CALL      'P03BFIXE'
     C                   PARM                    article_numero
     C                   PARM                    article_prix
     C     article_prix  DSPLY
     C                   EVAL      *inlr = *on
