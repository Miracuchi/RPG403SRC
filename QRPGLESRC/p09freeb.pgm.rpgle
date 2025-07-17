**free
      //%METADATA                                                      *
      // %TEXT Ex09B : Fichiers BDD lecture LF                         *
      //%EMETADATA                                                     *

dcl-f dvd_by_an keyed;
dcl-s i int(3);

read dvd_by_an;

FOR i = 1 TO 5;
  dsply (titre + %char(annee));
  read dvd_by_an;
// Le corps de la boucle va ici
ENDFOR;

*inlr = *on;
