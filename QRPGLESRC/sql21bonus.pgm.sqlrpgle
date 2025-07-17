**free
      //%METADATA                                                      *
      // %TEXT Ex21C : Ajout d'un critère de recherche                 *
      //%EMETADATA                                                     *

ctl-opt option(*srcstmt:*nodebugio);
dcl-f dps21bonus workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn packed(4);

dcl-s deb_req varchar(100) inz('SELECT titre, annee FROM dvd WHERE 1 = 1 ');
dcl-s req varchar(200);

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


  exec sql prepare req1 from :req;
  exec sql declare c1 cursor for req1;
  exec sql open c1;
  exec sql fetch c1 into :titre, :annee;
  dow sqlcod = 0;
    rrn = rrn +1;
    write fmtenr;
    exec sql fetch c1 into :titre, :annee;
  enddo;


  //  else;
  //    *in42 = *on;

  *in34 = *on;
  exec sql close c1;
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

