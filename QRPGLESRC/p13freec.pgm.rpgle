**free
      //%METADATA                                                      *
      // %TEXT Ex13C : Fichier écran maj BDD                           *
      //%EMETADATA                                                     *

dcl-f videodsp2 workstn;
dcl-f dvd usage(*output:*update) keyed;

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
  exfmt fmt4;
  if not *in03;
     update fmtdvd;
  endif;

endsr;
