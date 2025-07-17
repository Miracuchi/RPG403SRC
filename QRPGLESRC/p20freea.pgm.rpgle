**free
      //%METADATA                                                      *
      // %TEXT Ex20A : Controle de validation                          *
      //%EMETADATA                                                     *

dcl-f videodsp2b workstn;
dcl-f dvd usage(*output:*update) keyed commit;

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
    exfmt fmt5;
    if rep = 'O';
      commit;
    else;
      rolbk;
    endif;
  else;
    unlock dvd;
  endif;

endsr;
