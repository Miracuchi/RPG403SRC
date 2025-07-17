**free
      //%METADATA                                                      *
      // %TEXT Ex04 : Fonctions subst avec variable                    *
      //%EMETADATA                                                     *
dcl-s numeroSecu char(20) inz('195039717077721');
dcl-s dptNaissance char(2);
dcl-s anneeNaissance char(2);
dcl-s message char(50);
dcl-s start int(3);
dcl-s length int(3) inz(2);

start = 6;
length = 2;
dptNaissance = %subst(numeroSecu:start:length);

start = length;
anneeNaissance = %subst(numeroSecu:start:length);
message = 'Année de naissance : ' + anneeNaissance + '. Département : ' + dptNaissance;
dsply message;
*inlr = *on;

