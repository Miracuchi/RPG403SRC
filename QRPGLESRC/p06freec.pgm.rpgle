**free
      //%METADATA                                                      *
      // %TEXT Ex06C : Mise en pratique de l algorithmie               *
      //%EMETADATA                                                     *

dcl-s nombre uns(3);
dcl-s OK ind;
dcl-c message 'Entrez un nombre compris entre 10 et 20';
dcl-s resultat varchar(30);

DOW OK <> *ON;
  dsply message '*EXT' nombre;
  if nombre < 10;
    resultat = 'Le nombre doit être plus grand';
    dsply resultat;
  elseif nombre > 20;
    resultat = 'Le nombre doit être plus petit';
    dsply resultat;
  else;
    resultat = 'Le nombre ' +  %char(nombre) + ' est correct';
    dsply resultat;
    OK = *ON;
  endif;
ENDDO;
*inlr = *on;
