**free
      //%METADATA                                                      *
      // %TEXT Ex07B : Sous routine                                    *
      //%EMETADATA                                                     *
dcl-s numeroSecu char(20) inz('195039717077721');
dcl-s message varchar(50);
dcl-s i int(3);
dcl-s start int(3);
dcl-s length int(3);
dcl-s libelle char(20);

FOR i = 1 TO 6;
  SELECT i;
  WHEN-is 1;
    start = i;
    length = i;
    message = 'Sexe : ';
  WHEN-is 2;
    start = i;
    length = i;
    message = 'Année : ';
  WHEN-is 3;
    start = i + 1;
    length = i - 1;
    message = 'Mois : ';
  WHEN-is 4;
    start = i + 2;
    length = 2;
    message = 'Département : ';
  WHEN-is 5;
    start = i + 3;
    length = i - 2;
    message = 'Code commune : ';
  WHEN-is 6;
    start = i + 5;
    length = i-3;
    message = 'N° d''ordre : ';
  ENDSL;
  libelle = message + %subst(numeroSecu:start:length);
  exsr sr1;
ENDFOR;
*inlr = *on;


begsr sr1;
  dsply libelle;
endsr;

