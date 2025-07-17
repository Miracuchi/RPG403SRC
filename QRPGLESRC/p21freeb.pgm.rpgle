**free
      //%METADATA                                                      *
      // %TEXT Ex21B : Entrée fait rester sur la page en cours         *
      //%EMETADATA                                                     *

dcl-f dsp21b workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn packed(4);
dcl-f dvd;

setll 1 dvd;


if %found;
  exsr rempli_sfl;
  rang = 1;
  dow not *in03;
    if rrn <> 0;
      exsr dsp_page1;
      rang = hautpage;
    endif;
  enddo;
endif;

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

