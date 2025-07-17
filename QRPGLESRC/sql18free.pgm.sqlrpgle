**free
      //%METADATA                                                      *
      // %TEXT Ex01C : SQL statique sans curseur C                     *
      //%EMETADATA                                                     *

dcl-s dureeMoyenne zoned(3);

exec sql select avg(duree) into :dureeMoyenne from dvd;

dsply ('La durée moyenne des films est de : ' + %char(dureeMoyenne) + ' minutes');

*inlr = *on;
