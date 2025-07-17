**free
      //%METADATA                                                      *
      // %TEXT Ex06B : Mise en pratique de l algorithmie               *
      //%EMETADATA                                                     *

dcl-s age uns(3);
dcl-c texteAge 'Age ?';
dcl-s message varchar(30);

dsply texteAge '*EXT' age;

SELECT age;
WHEN-in %range(6:7);
    message = 'Poussin';
WHEN-in %range(8:9);
    message = 'Pupille';
// Insérer plus de blocs WHEN ici
when-in %range(10:11);
  message = 'Minime';
when-in %range(0:5);
  message = 'Valeur trop faible';
other;
  message = 'Cadet';

ENDSL;

dsply message;

*inlr = *on;
