**free
      //%METADATA                                                      *
      // %TEXT Ex23A : Procedure internes                              *
      //%EMETADATA                                                     *
ctl-opt actgrp(*new);
dcl-f dsp23a workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn like(rang);
dcl-f dvd;

write touches;
exfmt fmt2;

dow not *in03;
  setll 1 dvd;
  if %found;
    rempli_sfl();
    rang = 1;
    if rrn <> 0;
      dsp_page1();
      dow not *in12;
        select;
        when *in03;
          exsr sortie;
        when *in38;
          rempli_sfl();
          rang = rrn;
        other;
          rang = hautpage;
        endsl;
        dsp_page1();
      enddo;
      clear_sfl();
      write touches;
    else;
      *in43 = *on;
    endif;
  endif;
  exfmt fmt2;
enddo;
*inlr = *on;
begsr sortie;
  *inlr = *on;
  return;
endsr;

//begsr rempli_sfl;
//  for i = 1 to 5;
//    read dvd;
//    titreMaj = %upper(TITRE);
//    if recherche <> *blank;
//      if %eof;
//        *in34 = *on;
//        leave;
//      endif;
//      if %scan(%trim(RECHERCHE):titreMaj) = 0;
//        i = i-1;
//      endif;
//      if %scan(%trim(RECHERCHE):titreMaj) <> 0;
//        rrn = rrn +1;
//        write fmtenr;
//      endif;
//    else;
//      *in42 = *on;
//    endif;
//  endfor;
//endsr;

dcl-proc rempli_sfl;
dcl-s i like(rang);
dcl-s titreMaj char(52);
  i = 1;
  read dvd;
  if recherche <> *blanks;
    dow i <= 5;
    titreMaj = %upper(TITRE);
      if %scan(%trim(RECHERCHE):titreMaj) <> 0;
        rrn = rrn +1;
        i = i+1;
        write fmtenr;
      endif;
      read dvd;
      if %eof;
      *in34 = *on;
      leave;
    endif;
    enddo;
  else;
    *in42 = *on;
  endif;
end-proc;

dcl-proc clear_sfl;
  reset rrn;
  reset *in34;
  *in30 = *on;
  write fmtctl;
  *in30 = *off;
end-proc;

dcl-proc dsp_page1;
  *in32 =*on;
  exfmt fmtctl;  // ATTEND UNE ACTION DE L'UTILISATEUR
  *in32 = *off;
end-proc;


