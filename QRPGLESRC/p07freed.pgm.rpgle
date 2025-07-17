**free
      //%METADATA                                                      *
      // %TEXT Ex07D : Programmation masque                            *
      //%EMETADATA                                                     *

dcl-s numZone zoned(10) inz(2221234555);
dcl-c masque '   &(Bordereau)&    &(Commande)&   &(Fournisseur)';
dsply (%editw(numZone:masque));
*inlr = *on;
