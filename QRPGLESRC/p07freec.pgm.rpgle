**free
      //%METADATA                                                      *
      // %TEXT Ex07C : Programmation fonction RPG                      *
      //%EMETADATA                                                     *

dcl-s numeroSecu varchar(20) inz('1950397170777');
dcl-s digits char(10) inz('0123456789');
dcl-s hasDigitOnly zoned(2);
dcl-s letterA char(1) inz('A');
dcl-s msg varchar(10);
dcl-s message varchar(30) inz('Vous êtes vivant');

numeroSecu = %scanrpl(%subst(numeroSecu:4):letterA:numeroSecu);

message = 'Vous êtes grand';
message = %concat(*none:message:'e');
hasDigitOnly = %check(digits:numeroSecu);
msg = %char(hasDigitOnly);
dsply msg;
dsply message;







*inlr = *on;
