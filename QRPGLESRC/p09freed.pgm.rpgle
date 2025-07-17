**free
      //%METADATA                                                      *
      // %TEXT Ex09D : Fichiers BDD lecture setll                      *
      //%EMETADATA                                                     *

dcl-f dvd_by_an keyed;

dcl-s i int(3);
dcl-s annee1 zoned(4);

annee1 = 1999;

setll annee1 dvd_by_an;
if %equal;
reade annee1 dvd_by_an;
  FOR i = 1 TO 2;
    dsply (titre + %char(annee));
    reade annee1 dvd_by_an;
  // Le corps de la boucle va ici
  ENDFOR;
endif;
*inlr = *on;
