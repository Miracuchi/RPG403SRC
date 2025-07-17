**free
      //%METADATA                                                      *
      // %TEXT Ex16O1 : date début et fin de mois                      *
      //%EMETADATA                                                     *
ctl-opt datfmt(*eur);

dcl-s currentDate date(*eur);
dcl-s dayNum zoned(10);
dcl-s mthBeg date;
dcl-s mthEnd date;

currentDate = %date();
dayNum = %subdt(currentDate:*d);

mthBeg = currentDate - %days(dayNum - 1);
mthEnd = mthBeg + %months(1) - %days(1);

dsply %char(currentDate);
dsply %char(mthBeg);
dsply %char(mthEnd);
*inlr = *on;

