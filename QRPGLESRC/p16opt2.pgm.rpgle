**free
      //%METADATA                                                      *
      // %TEXT Ex16O2 : date début et fin de mois saisie               *
      //%EMETADATA                                                     *
ctl-opt datfmt(*eur);
dcl-f P16OPT2 workstn;

dcl-s dayNum zoned(10);


exfmt P16OPT2E;

dow not *in03;
  dayNum = %subdt(currdate:*d);
  mthbeg = currDate - %days(dayNum - 1);
  mthend = mthBeg + %months(1) - %days(1);
  exfmt P16OPT2E;
enddo;


//dsply %char(currentDate);
//dsply %char(mthBeg);
//dsply %char(mthEnd);
*inlr = *on;

