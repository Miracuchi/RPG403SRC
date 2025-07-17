**free
      //%METADATA                                                      *
      // %TEXT Ex12E : Fichier écran alt indicateur on/off             *
      //%EMETADATA                                                     *

dcl-f videodsp1 workstn;

exfmt fmt1;
dow not *in03;

  TITRE = 'Watchmen';
  genre = 'H';
  annee = 2009;
  duree = 180;
  exsr srfmt3;

  if (*in03);
    exfmt fmt1;
  endif;

enddo;
*inlr = *on;

begsr srfmt3;
  dow not *in03;

    if *in10;

      *in43 = not *in43;
      detail1 = 'Détails bientôt';
    endif;

    exfmt fmt3;
 enddo;
 *in43 = *off;
endsr;
