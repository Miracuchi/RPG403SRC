**free
      //%METADATA                                                      *
      // %TEXT Ex13A : Fichier écran et acces BDD par n°/clé           *
      //%EMETADATA                                                     *

dcl-f videodsp1 workstn;
dcl-f dvd keyed;

exfmt fmt1;
dow not *in03;
  chain coddvd dvd;
  if %found;
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
