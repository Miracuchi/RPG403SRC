**free
      //%METADATA                                                      *
      // %TEXT Ex06D : Mise en pratique de l algorithmie               *
      //%EMETADATA                                                     *

dcl-s indiceDepart uns(3);
dcl-s i uns(3);
dcl-c message 'Entrez une valeur de départ';

dsply message '*EXT' indiceDepart;

FOR i = 1 TO 5;
  dsply %char(indiceDepart + i);
ENDFOR;

*inlr = *on;
