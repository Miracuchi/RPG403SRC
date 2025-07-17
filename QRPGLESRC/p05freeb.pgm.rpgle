**free
      //%METADATA                                                      *
      // %TEXT Ex05B : Fonctions subst scanr via param                 *
      //%EMETADATA                                                     *


// /rep1/rep2/fic.txt
// /www/iwsdemo/conf/httpd.conf

dcl-pi *n;
  fichier_ifs char(500);
end-pi;
dcl-s message char(50);
message = 'Nom du fichier : ' + %subst(fichier_ifs : %scanr('/' : fichier_ifs) + 1);
dsply %trimr(message);
*inlr = *on;
