**free
      //%METADATA                                                      *
      // %TEXT Ex05 : Fonctions subst scanr                            *
      //%EMETADATA                                                     *

dcl-s fichier_ifs varchar(500) inz('/rep1/rep2/fic.txt');
// /rep1/rep2/fic.txt
// /www/iwsdemo/conf/httpd.conf
dcl-s message char(50);
message = 'Nom du fichier : ' + %subst(fichier_ifs : %scanr('/' : fichier_ifs) + 1);
dsply message;
*inlr = *on;
