**free
      //%METADATA                                                      *
      // %TEXT Ex21A : Sous fichier statique                           *
      //%EMETADATA                                                     *

dcl-f dsp21a workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn packed(4);
dcl-f dvd;

setll 1 dvd;

dow not *in03;
  if %found;
    exsr rempli_sfl;
    if rrn <> 0;
      exsr dsp_page1;
    endif;
  endif;
enddo;
*inlr = *on;

begsr rempli_sfl;
  read dvd;
  dow not %eof;
    rrn = rrn +1;
    write fmtenr;
    read dvd;
  enddo;
  *in34 = *on;
endsr;

begsr dsp_page1;
  write touches; // N'ATTEND PAS D'ACTION DE L'UTILISATEUR
  exfmt fmtctl;  // ATTEND UNE ACTION DE L'UTILISATEUR
endsr;

