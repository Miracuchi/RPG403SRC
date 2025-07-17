**free
      //%METADATA                                                      *
      // %TEXT Ex18O1 : Aff film dont duree > dureedtaara              *
      //%EMETADATA                                                     *

ctl-opt option(*srcstmt);
dcl-f dvd;

dcl-ds films dim(*auto:50) qualified;
  titre like(titre);
  duree like(duree);
  annee like(annee);
end-ds;
dcl-s i zoned(3) inz(1);
dcl-s refDuree zoned(3) dtaara('RPG403/DUREE');

in refDuree;

setll *start dvd;
read dvd;
dow not %eof ;

 if (duree > refDuree);
   films(i).titre = titre;
   films(i).duree = duree;
   films(i).annee = annee;
   i+=1;
 endif;
 read dvd;
enddo;

sorta(a) films %fields(annee:duree);

//dsply films(1).titre;

for i = 1 to %elem(films);
   dsply films(i).titre;
   dsply films(i).duree;

endfor;


*inlr = *on;
