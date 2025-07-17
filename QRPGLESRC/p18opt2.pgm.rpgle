**free
      //%METADATA                                                      *
      // %TEXT Ex18O2 : Décompo de string tableaux                     *
      //%EMETADATA                                                     *

dcl-c texte1 '{"MATRIX", "SPIDERMAN", "INCEPTION", "GLADIATOR", "THE BATMAN"}';
dcl-s texte2 varchar(50);

for-each texte2 in %split(%xlate('{}"':'    ':texte1):',');
  dsply %trim(texte2);
endfor;

*inlr = *on;

