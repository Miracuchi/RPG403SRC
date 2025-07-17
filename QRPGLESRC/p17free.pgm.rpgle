**free
      //%METADATA                                                      *
      // %TEXT Ex16 : Zone de donnée DTAARA                            *
      //%EMETADATA                                                     *

dcl-f videodsp1 workstn;
dcl-f dvd keyed;
dcl-s currentDate date(*iso);
dcl-s currentYear packed(4:0);
dcl-s soc char(30) dtaara('SOCIETE');


currentDate = %date();
currentYear = %subdt(currentDate:*y);

in *lock soc;

NOMSOCIETE = soc;

exfmt fmt1;
dow not *in03;
  chain coddvd dvd;
  if %found;
    exsr srfmt3;
  else;
    *in41 = *on;

  endif;

  exfmt fmt1;
enddo;
*inlr = *on;

begsr srfmt3;
  exfmt fmt3;
  dow not *in03;
    if *in10;
      detail1 = 'Il y a ' + %char(currentYear - annee) + ' ans';
      *in43 = not *in43;
    endif;
    exfmt fmt3;
  enddo;
  *in43 = *off;
endsr;
