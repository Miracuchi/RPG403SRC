**free
      //%METADATA                                                      *
      // %TEXT Ex13D : Fichier écran et erreur année                   *
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
  *in62 = *off;
  exfmt fmt4;
  dow not *in03;
    if not(annee in %range(1895:2025));
      *in62 = *on;
    else;
      update fmtdvd;
      *in62 = *off;
      leave;
    endif;
    exfmt fmt4;
  enddo;
endsr;
