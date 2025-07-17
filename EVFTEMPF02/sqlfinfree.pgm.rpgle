**free

dcl-pi *n;
    id_anip int(10);
end-pi;
dcl-s message varchar(52);
dcl-s nom varchar(25);
dcl-s prenom varchar(20);


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
**END-FREE
     D                 DS                                                       OPEN
     D  SQL_00000              1      2B 0 INZ(128)                             length of header
     D  SQL_00001              3      4B 0 INZ(2)                               statement number
     D  SQL_00002              5      8U 0 INZ(0)                               invocation mark
     D  SQL_00003              9      9A   INZ('0') CCSID(*JOBRUNMIX)           data is okay
     D  SQL_00004             10    128A   CCSID(*JOBRUNMIX)                    end of header
     D  SQL_00005            129    132I 0                                      ID_ANIP
**FREE
**END-FREE
     D                 DS                                                       FETCH
     D  SQL_00006              1      2B 0 INZ(128)                             length of header
     D  SQL_00007              3      4B 0 INZ(3)                               statement number
     D  SQL_00008              5      8U 0 INZ(0)                               invocation mark
     D  SQL_00009              9      9A   INZ('0') CCSID(*JOBRUNMIX)           data is okay
     D  SQL_00010             10    128A   CCSID(*JOBRUNMIX)                    end of header
     D  SQL_00011            129    155A   VARYING CCSID(*JOBRUNMIX)            NOM
     D  SQL_00012            156    177A   VARYING CCSID(*JOBRUNMIX)            PRENOM
**FREE
**END-FREE
     D                 DS                                                       FETCH
     D  SQL_00013              1      2B 0 INZ(128)                             length of header
     D  SQL_00014              3      4B 0 INZ(4)                               statement number
     D  SQL_00015              5      8U 0 INZ(0)                               invocation mark
     D  SQL_00016              9      9A   INZ('0') CCSID(*JOBRUNMIX)           data is okay
     D  SQL_00017             10    128A   CCSID(*JOBRUNMIX)                    end of header
     D  SQL_00018            129    155A   VARYING CCSID(*JOBRUNMIX)            NOM
     D  SQL_00019            156    177A   VARYING CCSID(*JOBRUNMIX)            PRENOM
**FREE
**END-FREE
     D                 DS                                                       CLOSE
     D  SQL_00020              1      2B 0 INZ(128)                             length of header
     D  SQL_00021              3      4B 0 INZ(5)                               statement number
     D  SQL_00022              5      8U 0 INZ(0)                               invocation mark
     D  SQL_00023              9      9A   INZ('0') CCSID(*JOBRUNMIX)           data is okay
     D  SQL_00024             10    127A   CCSID(*JOBRUNMIX)                    end of header
     D  SQL_00025            128    128A   CCSID(*JOBRUNMIX)                    end of header
**FREE
//*exec sql declare c1 cursor for select p.nom, p.prenom from personne p
//*    inner join adoption ad on p.id_per = ad.id_per
//*    inner join animal an on ad.id_ani = an.id_ani
//*    where an.id_ani = :id_anip;
//*exec sql open c1;
          SQL_00005 = ID_ANIP;                                                  //SQL
          SQLER6 = -4;                                                          //SQL
          IF SQL_00002 = 0                                                      //SQL
          OR SQL_00003 <> *LOVAL;                                               //SQL
          SQLROUTE_CALL(                                                        //SQL
               SQLCA                                                            //SQL
             : SQL_00000                                                        //SQL
          );                                                                    //SQL
          ELSE;                                                                 //SQL
          SQLOPEN_CALL(                                                         //SQL
               SQLCA                                                            //SQL
             : SQL_00000                                                        //SQL
          );                                                                    //SQL
          ENDIF;                                                                //SQL


//*exec sql fetch from c1 into :nom, :prenom;
          SQLER6 = -4;                                                          //SQL 3
          SQLROUTE_CALL(                                                        //SQL
               SQLCA                                                            //SQL
             : SQL_00006                                                        //SQL
          );                                                                    //SQL
          IF SQL_00009 = '1';                                                   //SQL
          EVAL NOM = SQL_00011;                                                 //SQL
          EVAL PRENOM = SQL_00012;                                              //SQL
          ENDIF;                                                                //SQL
dow sqlcod = 0;
    message = %trim(nom) + ' ' + %trim(prenom);
    dsply message;
//*    exec sql fetch from c1 into :nom, :prenom;
          SQLER6 = -4;                                                          //SQL 4
          SQLROUTE_CALL(                                                        //SQL
               SQLCA                                                            //SQL
             : SQL_00013                                                        //SQL
          );                                                                    //SQL
          IF SQL_00016 = '1';                                                   //SQL
          EVAL NOM = SQL_00018;                                                 //SQL
          EVAL PRENOM = SQL_00019;                                              //SQL
          ENDIF;                                                                //SQL
enddo;
//*exec sql close c1;
          SQLER6 = 5;                                                           //SQL
          IF SQL_00022 = 0;                                                     //SQL
          SQLROUTE_CALL(                                                        //SQL
               SQLCA                                                            //SQL
             : SQL_00020                                                        //SQL
          );                                                                    //SQL
          ELSE;                                                                 //SQL
          SQLCLSE_CALL(                                                         //SQL
               SQLCA                                                            //SQL
             : SQL_00020                                                        //SQL
          );                                                                    //SQL
          ENDIF;                                                                //SQL



*inlr = *on;




