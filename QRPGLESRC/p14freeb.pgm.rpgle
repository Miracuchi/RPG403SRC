**free
      //%METADATA                                                      *
      // %TEXT Ex14B : Enumeration                                     *
      //%EMETADATA                                                     *

dcl-enum tauxTva qualified;
  normal 20;
  intermediaire 10;
  reduit 5;
  super_reduit 2;
end-enum;
dcl-s tauxEntre uns(3);
dcl-s taux uns(3);
dcl-c msg 'Entrez un taux de TVA';
dcl-c msg2 'Taux non référencé - ';

dsply msg '*EXT' tauxEntre;
dow not (tauxEntre in tauxTva);
  dsply (msg2 + msg) '*EXT' tauxEntre;
enddo;

dsply ('Taux de TVA ' + %char(tauxEntre) + ' référencé');
dsply ('Taux de TV le plus élevé : ' + %char(%hival(tauxTva)));
dsply ('Taux de TV le moins élevé : ' + %char(%loval(tauxTva)));

dsply 'Liste des taux : ';
for-each taux in tauxTva;
  dsply %char(taux);
endfor;

*inlr = *on;
