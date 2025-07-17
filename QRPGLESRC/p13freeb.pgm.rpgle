**free
      //%METADATA                                                      *
      // %TEXT Ex13B : Fichier écran et acces BDD par nom              *
      //%EMETADATA                                                     *

dcl-f videodsp1 workstn;
dcl-f dvd;
dcl-s ok ind;
dcl-s titreMaj char(52);

exfmt fmt2;
dow not *in03;
  exsr rechercheFilm;
  if not ok;
    *in42 = *on;
  endif;
  exfmt fmt2;
  *in42 = *on;
enddo;
*inlr = *on;

begsr srfmt3;
  exfmt fmt3;
  dow not *in03 and *in10;
    if *in10;
      detail1 = 'Détails bientôt';
      *in43 = not *in43;
    endif;
    exfmt fmt3;
  enddo;
  *in43 = *off;
endsr;

begsr rechercheFilm;
  ok=*off;
  setll *start dvd;
  read dvd;
  if recherche<>*blank;
    dow not %eof and not *in03;
      titreMaj = %upper(TITRE);
      if %scan(%trim(RECHERCHE):titreMaj) <> 0;
        ok = *on;
        exsr srfmt3;
      endif;
      read dvd;
    enddo;
  endif;
endsr;
