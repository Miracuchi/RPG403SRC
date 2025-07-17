**free
      //%METADATA                                                      *
      // %TEXT Exercice 02  Déclaration de constantes et variabl      *
      //%EMETADATA                                                     *
dcl-s article_numero int(3);
dcl-s article_prix zoned(7:2) inz(19.99);
// zone de traitement
dcl-pr pgm00e4 extpgm('P03BFREE');
   *n like (article_numero);
   *n like (article_prix);
end-pr;

article_numero = 100;
pgm00e4(article_numero:article_prix);

dsply article_prix;
*inlr = *on;
