**free
      //%METADATA                                                      *
      // %TEXT Ex21C : Ajout d'un critère de recherche                 *
      //%EMETADATA                                                     *

ctl-opt option(*srcstmt:*nodebugio);
dcl-f dsp21c workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn packed(4);
//dcl-s deb_req varchar(50) inz('SELECT titre, annee FROM dvd WHERE ');
 dcl-s deb_req varchar(100) inz('SELECT titre, annee FROM dvd WHERE upper(titre) like ''%');
dcl-s req varchar(200);
dcl-s titreMaj char(52);


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
  exec sql close c1;
  exfmt fmt2;
enddo;


*inlr = *on;

// select * from dvd where titre like %recherche%

begsr rempli_sfl;
  if recherche <> *blank;
//    req = deb_req + %upper(%trim(titre)) + ' LIKE ''%' + %trim(%upper(RECHERCHE)) + '%'''; NE FONC
    req = deb_req + %trim(%upper(RECHERCHE)) + '%''';
    exec sql prepare req1 from :req;
    exec sql declare c1 cursor for req1;
    exec sql open c1;
    exec sql fetch c1 into :titre, :annee;
    dow sqlcod = 0;
      rrn = rrn +1;
      write fmtenr;
      exec sql fetch c1 into :titre, :annee;
    enddo;
  else;
    *in42 = *on;
  endif;
  *in34 = *on;
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

