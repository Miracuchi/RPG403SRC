**free
      //%METADATA                                                      *
      // %TEXT Ex21C : Ajout d'un critère de recherche                 *
      //%EMETADATA                                                     *

dcl-f dsp21c workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn packed(4);
dcl-f dvd;
dcl-s titreMaj char(52);

write touches;
exfmt fmt2;

dow not *in03;
  rang = 1;
  setll 1 dvd;
  if %found;
    exsr rempli_sfl;
    rang = 1;
    if rrn <> 0;
      exsr dsp_page1;
      dow not *in12;
        if *in03;
          exsr sortie;
        endif;
        rang = hautpage;
        exsr dsp_page1;
        write touches;

      enddo;
    else;
      *in43 = *on;
    endif;
    exsr clear_sfl;
  endif;
  exfmt fmt2;
enddo;
*inlr = *on;



begsr rempli_sfl;
  read dvd;
  if recherche <> *blank;
    dow not %eof;
      titreMaj = %upper(TITRE);
      if %scan(%trim(RECHERCHE):titreMaj) <> 0;
        rrn = rrn +1;
        write fmtenr;
      endif;
      read dvd;
    enddo;
  else;
    *in42 = *on;
  endif;
  *in34 = *on;
endsr;

begsr clear_sfl;
  reset rrn;
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

