**free
      //%METADATA                                                      *
      // %TEXT Ex22A : Sous fichier dynamique                          *
      //%EMETADATA                                                     *

dcl-f dsp22a1 workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn like(rang);
dcl-f dvd;
dcl-s titreMaj char(52);
dcl-s i like(rang);

write touches;
exfmt fmt2;

dow not *in03;

  setll 1 dvd;
  if %found;
    exsr rempli_sfl;
    rang = 1;
    if rrn <> 0;
      exsr dsp_page1;
      dow not *in12;
        select;
        when *in03;
          exsr sortie;
        when *in38;
          exsr rempli_sfl;
          rang = rrn;
        other;
          rang = hautpage;
        endsl;
        exsr dsp_page1;
      enddo;
      exsr clear_sfl;
      write touches;
    else;
      *in43 = *on;
    endif;
  endif;
  exfmt fmt2;
enddo;
*inlr = *on;

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

begsr rempli_sfl;
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
endsr;

begsr clear_sfl;
  reset rrn;
  reset *in34;
  *in30 = *on;
  write fmtctl;
  *in30 = *off;
endsr;

begsr dsp_page1;
  *in32 =*on;
  exfmt fmtctl;  // ATTEND UNE ACTION DE L'UTILISATEUR
  *in32 = *off;
endsr;

begsr sortie;
  *inlr = *on;
  return;
endsr;

