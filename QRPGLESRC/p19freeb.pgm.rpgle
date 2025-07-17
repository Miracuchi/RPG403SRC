**free
      //%METADATA                                                      *
      // %TEXT Ex19B : PRTF Direct vers le splf                        *
      //%EMETADATA                                                     *
ctl-opt option(*srcstmt);
dcl-f videodsp1b workstn;
dcl-f videoprt1 printer oflind(*in56) usropn;
dcl-f dvd keyed;
dcl-s cmd char(500);
dcl-s lg packed(15:5);
dcl-c hello 'value';

dcl-pr execl extpgm('QCMDEXC');
  *n like(cmd);
  *n like(lg);
end-pr;

exfmt fmt1;
dow not *in03;

  if (*in20);
    exsr impressionListe;
  else;
    chain coddvd dvd;
    if %found;
      exsr srfmt3;
    else;
      *in41 = *on;
    endif;
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

begsr impressionListe;
  open videoprt1;
  write entete;
  setll *start dvd;
  read dvd;

  dow not %eof;
    CODDVD = coddvd;
    titre = titre;
    write detail;
    if *in56;
      write entete;
      *in56 = *off;
    endif;
    read dvd;
  enddo;
  close videoprt1;

  cmd = 'DSPSPLF FILE(VIDEOPRT1) SPLNBR(*LAST)';
  lg = %len(%trim(cmd));
  execl(cmd:lg);

endsr;
