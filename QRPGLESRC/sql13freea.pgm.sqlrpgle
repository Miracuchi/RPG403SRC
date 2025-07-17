**free
      //%METADATA                                                      *
      // %TEXT Ex01A : SQL statique sans curseur A                     *
      //%EMETADATA                                                     *

dcl-f videodsp1 workstn;

exfmt fmt1;
dow not *in03;
  exec sql
    select coddvd, titre, genre, annee, duree
    into :coddvd, :titre, :genre, :annee, :duree from dvd where coddvd = :coddvd;
  if sqlcod = 0;
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
      detail1 = 'Détails bientôt';
      *in43 = not *in43;
    endif;
    exfmt fmt3;
  enddo;
  *in43 = *off;
endsr;
