**free
      //%METADATA                                                      *
      // %TEXT Ex23A : Fonctions SQL Part3                             *
      //%EMETADATA                                                     *

ctl-opt actgrp(*new) datfmt(*eur);

dcl-f dsp23c workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn like(rang);
dcl-f dvd;

       /SET CCSID(*CHAR:*JOBRUNMIX)
       // SQL COMMUNICATION AREA                                                //SQL
       DCL-DS SQLCA;                                                            //SQL
         SQLCAID CHAR(8) INZ(X'0000000000000000');                              //SQL
          SQLAID CHAR(8) OVERLAY(SQLCAID);                                      //SQL
         SQLCABC INT(10);                                                       //SQL
          SQLABC BINDEC(9) OVERLAY(SQLCABC);                                    //SQL
         SQLCODE INT(10);                                                       //SQL
          SQLCOD BINDEC(9) OVERLAY(SQLCODE);                                    //SQL
         SQLERRML INT(5);                                                       //SQL
          SQLERL BINDEC(4) OVERLAY(SQLERRML);                                   //SQL
         SQLERRMC CHAR(70);                                                     //SQL
          SQLERM CHAR(70) OVERLAY(SQLERRMC);                                    //SQL
         SQLERRP CHAR(8);                                                       //SQL
          SQLERP CHAR(8) OVERLAY(SQLERRP);                                      //SQL
         SQLERR CHAR(24);                                                       //SQL
          SQLER1 BINDEC(9) OVERLAY(SQLERR:*NEXT);                               //SQL
          SQLER2 BINDEC(9) OVERLAY(SQLERR:*NEXT);                               //SQL
          SQLER3 BINDEC(9) OVERLAY(SQLERR:*NEXT);                               //SQL
          SQLER4 BINDEC(9) OVERLAY(SQLERR:*NEXT);                               //SQL
          SQLER5 BINDEC(9) OVERLAY(SQLERR:*NEXT);                               //SQL
          SQLER6 BINDEC(9) OVERLAY(SQLERR:*NEXT);                               //SQL
          SQLERRD INT(10) DIM(6) OVERLAY(SQLERR);                               //SQL
         SQLWRN CHAR(11);                                                       //SQL
          SQLWN0 CHAR(1) OVERLAY(SQLWRN:*NEXT);                                 //SQL
          SQLWN1 CHAR(1) OVERLAY(SQLWRN:*NEXT);                                 //SQL
          SQLWN2 CHAR(1) OVERLAY(SQLWRN:*NEXT);                                 //SQL
          SQLWN3 CHAR(1) OVERLAY(SQLWRN:*NEXT);                                 //SQL
          SQLWN4 CHAR(1) OVERLAY(SQLWRN:*NEXT);                                 //SQL
          SQLWN5 CHAR(1) OVERLAY(SQLWRN:*NEXT);                                 //SQL
          SQLWN6 CHAR(1) OVERLAY(SQLWRN:*NEXT);                                 //SQL
          SQLWN7 CHAR(1) OVERLAY(SQLWRN:*NEXT);                                 //SQL
          SQLWN8 CHAR(1) OVERLAY(SQLWRN:*NEXT);                                 //SQL
          SQLWN9 CHAR(1) OVERLAY(SQLWRN:*NEXT);                                 //SQL
          SQLWNA CHAR(1) OVERLAY(SQLWRN:*NEXT);                                 //SQL
          SQLWARN CHAR(1) DIM(11) OVERLAY(SQLWRN);                              //SQL
         SQLSTATE CHAR(5);                                                      //SQL
          SQLSTT CHAR(5) OVERLAY(SQLSTATE);                                     //SQL
       END-DS SQLCA;                                                            //SQL
       DCL-PR SQLROUTE_CALL EXTPGM(SQLROUTE);                                   //SQL
         CA LIKEDS(SQLCA);                                                      //SQL
         *N BINDEC(4) OPTIONS(*NOPASS);                                         //SQL
         *N CHAR(1) OPTIONS(*NOPASS);                                           //SQL
       END-PR SQLROUTE_CALL;                                                    //SQL
       DCL-PR SQLOPEN_CALL EXTPGM(SQLOPEN);                                     //SQL
         CA LIKEDS(SQLCA);                                                      //SQL
         *N BINDEC(4);                                                          //SQL
       END-PR SQLOPEN_CALL;                                                     //SQL
       DCL-PR SQLCLSE_CALL EXTPGM(SQLCLSE);                                     //SQL
         CA LIKEDS(SQLCA);                                                      //SQL
         *N BINDEC(4);                                                          //SQL
       END-PR SQLCLSE_CALL;                                                     //SQL
       DCL-PR SQLCMIT_CALL EXTPGM(SQLCMIT);                                     //SQL
         CA LIKEDS(SQLCA);                                                      //SQL
         *N BINDEC(4);                                                          //SQL
       END-PR SQLCMIT_CALL;                                                     //SQL
       /RESTORE CCSID(*CHAR)
       DCL-C SQLROUTE CONST('QSYS/QSQROUTE');                                   //SQL
       DCL-C SQLOPEN CONST('QSYS/QSQROUTE');                                    //SQL
       DCL-C SQLCLSE CONST('QSYS/QSQLCLSE');                                    //SQL
       DCL-C SQLCMIT CONST('QSYS/QSQLCMIT');                                    //SQL
       DCL-C SQFRD CONST(2);                                                    //SQL
       DCL-C SQFCRT CONST(8);                                                   //SQL
       DCL-C SQFOVR CONST(16);                                                  //SQL
       DCL-C SQFAPP CONST(32);                                                  //SQL
write touches;
exfmt fmt2;

dow not *in03;
  setll 1 dvd;
  if %found;
    rempli_sfl();
    rang = 1;
    if rrn <> 0;
      dsp_page1();
      dow not *in12;
        select;
        when *in03;
          exsr sortie;
        when *in38;
          rempli_sfl();
          rang = rrn;
        other;
          rang = hautpage;
        endsl;
        dsp_page1();
      enddo;
      clear_sfl();
      write touches;
    else;
      *in43 = *on;
    endif;
  endif;
  exfmt fmt2;
enddo;
*inlr = *on;
begsr sortie;
  *inlr = *on;
  return;
endsr;

dcl-proc AgeFilm;
  dcl-pi *n packed(3);
    year like(annee);
  end-pi;
  dcl-s currentYear like(annee);
  dcl-s ageFilm like(annee);

  currentYear = %subdt(%date():*y);
  ageFilm = currentYear - year;

  return ageFilm;


end-proc;

//begsr rempli_sfl;
//  for i = 1 to 5;
//    read dvd;
//    titreMaj = %upper(TITRE);
//    if recherche <> *blank;
//      if %eof;
//        *in34 = *on;
//        leave;
//      endif;
//      if %scan(%trim(RECHERCHE):titreMaj) = 0;
//        i = i-1;
//      endif;
//      if %scan(%trim(RECHERCHE):titreMaj) <> 0;
//        rrn = rrn +1;
//        write fmtenr;
//      endif;
//    else;
//      *in42 = *on;
//    endif;
//  endfor;
//endsr;

dcl-proc rempli_sfl;
  dcl-s i like(rang);
  dcl-s titreMaj char(52);
**END-FREE
     D                 DS                  STATIC                               SELECT
     D  SQL_00000              1      2B 0 INZ(128)                             length of header
     D  SQL_00001              3      4B 0 INZ(1)                               statement number
     D  SQL_00002              5      8U 0 INZ(0)                               invocation mark
     D  SQL_00003              9      9A   INZ('0') CCSID(*JOBRUNMIX)           data is okay
     D  SQL_00004             10    128A   CCSID(*JOBRUNMIX)                    end of header
     D  SQL_00005            129    131P 0 PACKEVEN                             ANNEE
     D  SQL_00006            132    133P 0                                      AGE
**FREE
  i = 1;
  read dvd;
  if recherche <> *blanks;
    dow i <= 5;
      titreMaj = %upper(TITRE);
      if %scan(%trim(RECHERCHE):titreMaj) <> 0;
        rrn = rrn +1;
        i = i+1;
        //        age =  AgeFilm(annee);
//*        exec sql
//*        select age(:annee) into :age from dvd;
          SQL_00005 = ANNEE;                                                    //SQL
          SQLER6 = -4;                                                          //SQL 1
          SQLROUTE_CALL(                                                        //SQL
               SQLCA                                                            //SQL
             : SQL_00000                                                        //SQL
          );                                                                    //SQL
          IF SQL_00003 = '1';                                                   //SQL
          EVAL AGE = SQL_00006;                                                 //SQL
          ENDIF;                                                                //SQL
        write fmtenr;
      endif;
      read dvd;
      if %eof;
        *in34 = *on;
        leave;
      endif;
    enddo;
  else;
    *in42 = *on;
  endif;
end-proc;

dcl-proc clear_sfl;
  reset rrn;
  reset *in34;
  *in30 = *on;
  write fmtctl;
  *in30 = *off;
end-proc;

dcl-proc dsp_page1;
  *in32 =*on;
  exfmt fmtctl;  // ATTEND UNE ACTION DE L'UTILISATEUR
  *in32 = *off;
end-proc;


