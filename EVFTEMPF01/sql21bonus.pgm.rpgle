**free
      //%METADATA                                                      *
      // %TEXT Ex21C : Ajout d'un critère de recherche                 *
      //%EMETADATA                                                     *

ctl-opt option(*srcstmt:*nodebugio);
dcl-f dps21bonus workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn packed(4);

dcl-s deb_req varchar(100) inz('SELECT titre, annee FROM dvd WHERE 1 = 1 ');
dcl-s req varchar(200);

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
       DCL-PR SQCALL000002 EXTPGM(SQLROUTE);                                    //SQL
         CA LIKEDS(SQLCA);                                                      //SQL
         P0001 LIKE(REQ);                                                       //SQL
       END-PR SQCALL000002;                                                     //SQL
**END-FREE
     D                 DS                                                       OPEN
     D  SQL_00000              1      2B 0 INZ(128)                             length of header
     D  SQL_00001              3      4B 0 INZ(3)                               statement number
     D  SQL_00002              5      8U 0 INZ(0)                               invocation mark
     D  SQL_00003              9      9A   INZ('0') CCSID(*JOBRUNMIX)           data is okay
     D  SQL_00004             10    127A   CCSID(*JOBRUNMIX)                    end of header
     D  SQL_00005            128    128A   CCSID(*JOBRUNMIX)                    end of header
**FREE
**END-FREE
     D                 DS                                                       FETCH
     D  SQL_00006              1      2B 0 INZ(128)                             length of header
     D  SQL_00007              3      4B 0 INZ(4)                               statement number
     D  SQL_00008              5      8U 0 INZ(0)                               invocation mark
     D  SQL_00009              9      9A   INZ('0') CCSID(*JOBRUNMIX)           data is okay
     D  SQL_00010             10    127A   CCSID(*JOBRUNMIX)                    end of header
     D  SQL_00011            129    168A   CCSID(*JOBRUNMIX)                    TITRE
     D  SQL_00012            169    171P 0 PACKEVEN                             ANNEE
**FREE
**END-FREE
     D                 DS                                                       FETCH
     D  SQL_00013              1      2B 0 INZ(128)                             length of header
     D  SQL_00014              3      4B 0 INZ(5)                               statement number
     D  SQL_00015              5      8U 0 INZ(0)                               invocation mark
     D  SQL_00016              9      9A   INZ('0') CCSID(*JOBRUNMIX)           data is okay
     D  SQL_00017             10    127A   CCSID(*JOBRUNMIX)                    end of header
     D  SQL_00018            129    168A   CCSID(*JOBRUNMIX)                    TITRE
     D  SQL_00019            169    171P 0 PACKEVEN                             ANNEE
**FREE
**END-FREE
     D                 DS                                                       CLOSE
     D  SQL_00020              1      2B 0 INZ(128)                             length of header
     D  SQL_00021              3      4B 0 INZ(6)                               statement number
     D  SQL_00022              5      8U 0 INZ(0)                               invocation mark
     D  SQL_00023              9      9A   INZ('0') CCSID(*JOBRUNMIX)           data is okay
     D  SQL_00024             10    127A   CCSID(*JOBRUNMIX)                    end of header
     D  SQL_00025            128    128A   CCSID(*JOBRUNMIX)                    end of header
**FREE
write touches;
exfmt fmt2;

dow not *in03;
  exsr rempli_sfl;
  rang = 1;
  if rrn <> 0;
    exsr dsp_page1;
    dow not *in12;
      if *in03;
        exsr sortie;
      endif;
      rang = hautpage;
      exsr dsp_page1;
      write touches;
    enddo;
    exsr clear_sfl;
  endif;
  exfmt fmt2;
enddo;

*inlr = *on;

begsr rempli_sfl;
  reset req;
  if rtitre <> *blank;
    req = deb_req + ' and upper(titre) like ''%' + %trim(rtitre) + '%''';
  endif;

  if rannee <> *zeros;
    req = deb_req + ' and annee = ' + %char(rannee);
  endif;

  if rannee = *zeros and rtitre = *blanks;
    req = deb_req;
  endif;

  // if rannee <> *zeros and rtitre <> *blanks;
//    rtitre = %trim(rtitre);
 //   req = deb_req + ' and upper(titre) like ''%' + rtitre + '%''' + ' and annee = ' + %char(rannee
 // endif;


//*  exec sql prepare req1 from :req;
          SQLER6 = 2;                                                           //SQL
          SQCALL000002(                                                         //SQL
               SQLCA                                                            //SQL
             : REQ                                                              //SQL
          );                                                                    //SQL
//*  exec sql declare c1 cursor for req1;
//*  exec sql open c1;
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
//*  exec sql fetch c1 into :titre, :annee;
          SQLER6 = -4;                                                          //SQL 4
          SQLROUTE_CALL(                                                        //SQL
               SQLCA                                                            //SQL
             : SQL_00006                                                        //SQL
          );                                                                    //SQL
          IF SQL_00009 = '1';                                                   //SQL
          EVAL TITRE = SQL_00011;                                               //SQL
          EVAL ANNEE = SQL_00012;                                               //SQL
          ENDIF;                                                                //SQL
  dow sqlcod = 0;
    rrn = rrn +1;
    write fmtenr;
//*    exec sql fetch c1 into :titre, :annee;
          SQLER6 = -4;                                                          //SQL 5
          SQLROUTE_CALL(                                                        //SQL
               SQLCA                                                            //SQL
             : SQL_00013                                                        //SQL
          );                                                                    //SQL
          IF SQL_00016 = '1';                                                   //SQL
          EVAL TITRE = SQL_00018;                                               //SQL
          EVAL ANNEE = SQL_00019;                                               //SQL
          ENDIF;                                                                //SQL
  enddo;


  //  else;
  //    *in42 = *on;

  *in34 = *on;
//*  exec sql close c1;
          SQLER6 = 6;                                                           //SQL
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
endsr;

begsr clear_sfl;
  reset rrn;
  *in30 = *on;
  write fmtctl;
  *in30 = *off;
endsr;

begsr dsp_page1;
  *in32 =*on;
  exfmt fmtctl;  // ATTEND UNE ACTION DE L'UTILISATEUR
  *in32 = *off;
endsr;

begsr sortie;
  *inlr = *on;
  return;
endsr;

