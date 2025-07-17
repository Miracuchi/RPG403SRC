**free
      //%METADATA                                                      *
      // %TEXT Ex09A : Fichiers BDD lecture                            *
      //%EMETADATA                                                     *

dcl-f dvd;
dcl-s i int(3);
read dvd;

FOR i = 1 TO 5;
  dsply titre;
  read dvd;
// Utiliser %eof plus efficace
//

ENDFOR;

*inlr = *on;
