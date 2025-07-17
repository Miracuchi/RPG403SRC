      *%METADATA                                                       *
      * %TEXT Exercice 03  Passage de paramètres                      *
      *%EMETADATA                                                      *
     D art_num         S              3I 0
     D art_prix        S              7S 2
     C     *entry        PLIST
     C                   parm                    art_num
     C                   parm                    art_prix
     C     art_num       DSPLY
     C     art_prix      DSPLY
     C                   EVAL      art_prix = 18.99
     C                   EVAL      *inlr = *on
