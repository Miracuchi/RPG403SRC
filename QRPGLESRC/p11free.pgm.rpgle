**free
      //%METADATA                                                      *
      // %TEXT Ex11 : Fichiers BDD Ecriture                            *
      //%EMETADATA                                                     *

dcl-f dvd usage(*output:*update:*delete) keyed;
dcl-s cle zoned(5);

cle = 470;

chain cle dvd;
if %found;
  delete fmtdvd;
endif;

CODDVD = 470;
CODREA = 40;
TITRE = 'Matrix 4';
genre = 'S';
annee = 2021;
duree = 130;
write fmtdvd;

chain cle dvd;
if %found;
  dsply coddvd;
  dsply codrea;
  dsply titre;
  dsply genre;
  dsply annee;
  dsply duree;
endif;

chain cle dvd;
if %found;
  titre = 'The Matrix';
  update fmtdvd;
  chain cle dvd;
  dsply titre;
endif;


*inlr = *on;
