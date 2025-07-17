**free
      //%METADATA                                                      *
      // %TEXT Ex09C : Fichiers BDD lecture setgt                      *
      //%EMETADATA                                                     *

dcl-f dvd_by_an keyed;
dcl-s i int(3);
dcl-s annee1 zoned(4);
annee1 = 1990;
setgt annee1 dvd_by_an;
read dvd_by_an;
FOR i = 1 TO 5;
  dsply (titre + %char(annee));
  read dvd_by_an;
// Le corps de la boucle va ici
ENDFOR;

*inlr = *on;
