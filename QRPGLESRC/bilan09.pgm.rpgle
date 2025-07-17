**free
      //%METADATA                                                      *
      // %TEXT bilan - 09                                              *
      //%EMETADATA                                                     *

dcl-f videod1 workstn;
dcl-f dvd keyed;

exfmt fmta;
dow not *in03;
  chain coddvd dvd;
  if %found;
    codefilm = coddvd;
    titrefilm = titre;
    exfmt fmtb;
    dow not *in12;
      exfmt fmtb;
    enddo;
    else;
      *in50 = *on;

  endif;

  exfmt fmta;
  *in50 = *off;
enddo;

*inlr = *on;

//begsr afffmtb;
//
// dow not *in03;
//   exfmt fmtb;
// enddo;
//endsr;
