**free
      //%METADATA                                                      *
      // %TEXT Ex12C : Fichier écran alimentation zones                *
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
  exfmt fmt3;
endsr;
