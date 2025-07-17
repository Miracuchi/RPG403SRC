**free
      //%METADATA                                                      *
      // %TEXT Ex04 : Fonctions subst                                  *
      //%EMETADATA                                                     *
dcl-s numeroSecu char(20) inz('195039717077721');
dcl-s dptNaissance char(2);
dcl-s anneeNaissance char(2);
dcl-s message char(50);
dptNaissance = %subst(numeroSecu:6:2);
anneeNaissance = %subst(numeroSecu:2:2);
message = 'Année de naissance : ' + anneeNaissance + '. Département : ' + dptNaissance;
dsply message;
*inlr = *on;

