**free
      //%METADATA                                                      *
      // %TEXT Ex22B1 : Sous fichier en modif                          *
      //%EMETADATA                                                     *

dcl-f dsp22b1 workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn like(rang);
dcl-s rrnSave like(rang);
dcl-f dvd keyed usage(*update);
dcl-s titreMaj char(52);
dcl-s i like(rang);
dcl-s codSave like(coddvd);

write touches;
exfmt fmt2;

dow not *in03;
  setll *loval dvd;
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
          exsr lectureOption;
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
  rrn = rrnSave;
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
  codSave = coddvd;
  rrnSave = rrn;
endsr;

begsr clear_sfl;
  reset rrn;
  reset rrnSave;
  reset codSave;
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

begsr lectureOption;
  readc fmtenr;
  dow not %eof;
    select;
    when opt = '5';
      chain(n) coddvd dvd;
      if %found;
        exfmt details;
      endif;
    when opt = '2';
      *in70 = *on;
      chain coddvd dvd;
      if %found;
        exfmt details;
        if not *in12;
          update fmtdvd;
        else;
          unlock dvd;
        endif;
      endif;
    endsl;
    reset opt;
    update fmtenr;
    *in70 = *off;
    readc fmtenr;
  enddo;
  setgt codSave dvd;

endsr;

