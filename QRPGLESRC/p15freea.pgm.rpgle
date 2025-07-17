**free
      //%METADATA                                                      *
      // %TEXT Exo15 A : Gestion erreur => 1218                        *
      //%EMETADATA                                                     *

dcl-f videodsp2 workstn;
dcl-f dvd usage(*output:*update) keyed;

exfmt fmt1;
dow not *in03;
  monitor;
    chain coddvd dvd;
  on-error 1218;
    *in40 = *on;
  endmon;

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
  else;
    unlock dvd;
  endif;

endsr;
