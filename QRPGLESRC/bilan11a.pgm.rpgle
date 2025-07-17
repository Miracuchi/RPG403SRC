**free
      //%METADATA                                                      *
      // %TEXT BILAN11A                                                *
      //%EMETADATA                                                     *

dcl-f videod2a workstn;
dcl-f dvd keyed;

exfmt fmt1;
dow not *in03;
  chain coddvd dvd;
  if %found;
    exsr dspdvd;
    else;
       *in41 = *on;
      endif;
  if coddvd = *zeros;
    dsply 'Code à blanc';
  endif;
  exfmt fmt1;
enddo;

*inlr = *on;

begsr dspdvd;

  codef = coddvd;
  titref = titre;
  genref = genre;
  anneef = annee;
  dureef = duree;
  exfmt fmt2;

endsr;

