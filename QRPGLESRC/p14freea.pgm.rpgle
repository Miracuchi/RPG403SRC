**free
      //%METADATA                                                      *
      // %TEXT Ex14A : Data structure                                  *
      //%EMETADATA                                                     *
//dcl-s numeroSecu char(20) inz('195039717077721');
dcl-ds numeroSecu qualified;
  genre char(1);
  annee char(2);
  mois char(2);
  departement char(2);
  commune char(3);
  ordre char(3);
end-ds;
dcl-ds numeroSecu2 likeds(numeroSecu) ;

dcl-s message varchar(50);
dcl-s i int(3);

dcl-s libelle char(20);
numeroSecu = '195039717077721';
numeroSecu2 = '195039717077721';
dsply ('Année : ' + numeroSecu2.annee);
FOR i = 1 TO 6;
  SELECT i;
  WHEN-is 1;
    message = 'Sexe : ' + numeroSecu.genre;
  WHEN-is 2;
    message = 'Année : ' + numeroSecu.annee;
  WHEN-is 3;
    message = 'Mois : ' + numeroSecu.mois;
  WHEN-is 4;
    message = 'Département : '+ numeroSecu.departement;
  WHEN-is 5;
    message = 'Code commune : ' + numeroSecu.commune;
  WHEN-is 6;
    message = 'N° d''ordre : ' + numeroSecu.ordre;
  ENDSL;
  libelle = message;
  dsply libelle;
ENDFOR;
*inlr = *on;

