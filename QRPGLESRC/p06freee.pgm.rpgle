**free
      //%METADATA                                                      *
      // %TEXT Ex06E : Mise en pratique de l algorithmie               *
      //%EMETADATA                                                     *

dcl-s baseDuTriangle uns(3);
dcl-s i uns(3);
dcl-c message 'Entrez une valeur de départ';
dcl-s etoile varchar(50);

DOW baseDuTriangle < 1;
  // Le corps de la boucle va ici
  dsply message '*EXT' baseDuTriangle;

  FOR i = 1 TO baseDuTriangle;
    etoile = etoile + '*';
    dsply etoile;
  ENDFOR;
ENDDO;

*inlr = *on;
