**free
      //%METADATA                                                      *
      // %TEXT Ex18 : Tableaux                                         *
      //%EMETADATA                                                     *
dcl-f dvd;
dcl-s durees zoned(3:0) dim(*auto:100);
dcl-s dureeMoyenne zoned(3);

read dvd;
dow not %eof;
  durees(*next) = duree;
  read dvd;
enddo;

dureeMoyenne = %inth(%xfoot(durees)/%elem(durees));
dsply ('La durée moyenne des films est de : ' + %char(dureeMoyenne) + ' minutes');



*inlr = *on;
