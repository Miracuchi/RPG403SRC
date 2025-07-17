**free
      //%METADATA                                                      *
      // %TEXT BILAN11A                                                *
      //%EMETADATA                                                     *

dcl-f videod2a workstn;
dcl-f dvd keyed;

exfmt fmt1;
dow not *in03;
  if coddvd = *zeros;
    dsply 'Code à blanc';
  else;
    chain coddvd dvd;
    if %found;
      exsr dspdvd;
    else;
      *in41 = *on;
    endif;
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
  dow not *in12;
    exfmt fmt2;
  enddo;
endsr;
