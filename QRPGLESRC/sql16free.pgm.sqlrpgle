**free
      //%METADATA                                                      *
      // %TEXT Ex01B : SQL statique sans curseur B                     *
      //%EMETADATA                                                     *

dcl-f videodsp1 workstn;

dcl-s currentDate date(*iso);
dcl-s currentYear packed(4:0);

dcl-s yearFromDB packed(4:0);


currentDate = %date();
currentYear = %subdt(currentDate:*y);


exfmt fmt1;
dow not *in03;
  //  chain coddvd dvd;
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
      exec sql
        select annee into :yearFromDB from dvd where annee = :annee;
      if sqlcod = 0;
        detail1 = 'Il y a ' + %char(currentYear - yearFromDB) + ' ans';
      endif;
      *in43 = not *in43;
    endif;
    exfmt fmt3;
  enddo;
  *in43 = *off;
endsr;
