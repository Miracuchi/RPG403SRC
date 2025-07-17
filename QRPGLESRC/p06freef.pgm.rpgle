**free
      //%METADATA                                                      *
      // %TEXT Ex06F : Mise en pratique de l algorithmie               *
      //%EMETADATA                                                     *

dcl-s base uns(3);
dcl-s i uns(3);
dcl-c message 'Entrez une valeur de départ';
dcl-s etoile varchar(50);
DOW base < 1;
  // Le corps de la boucle va ici
  dsply message '*EXT' base;

  FOR i = 1 TO base;
  FOR index = start_value TO i;
      // Le corps de la boucle va ici
  ENDFOR;
    etoile = '*';
    dsply etoile;
  ENDFOR;
ENDDO;

*inlr = *on;
