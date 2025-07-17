**free
      //%METADATA                                                      *
      // %TEXT Ex12B : Fichier écran boucle de base                    *
      //%EMETADATA                                                     *

dcl-f videodsp1 workstn;

exfmt fmt1;
dow not *in03;
  dsply coddvd;
  exfmt fmt1;
enddo;


*inlr = *on;

