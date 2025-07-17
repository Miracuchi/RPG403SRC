**free
      //%METADATA                                                      *
      // %TEXT Ex21A : Sous fichier statique                           *
      //%EMETADATA                                                     *

dcl-f dsp21a workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn packed(4);

exec sql declare c1 cursor for select titre, annee from dvd;

exec sql open c1;

dow not *in03;

    exsr rempli_sfl;
    exsr dsp_page1;

enddo;

exec sql close c1;
*inlr = *on;

begsr rempli_sfl;
  exec sql fetch from c1 into :titre, :annee;
  dow sqlcod <> 100;
    rrn += 1;
    write FMTENR;
    exec sql fetch from c1 into :titre, :annee;
  enddo;
  *in34 = *on;
endsr;

begsr dsp_page1;
  write touches; // N'ATTEND PAS D'ACTION DE L'UTILISATEUR
  exfmt fmtctl;  // ATTEND UNE ACTION DE L'UTILISATEUR
endsr;

