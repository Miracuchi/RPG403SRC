**free
      //%METADATA                                                      *
      // %TEXT Ex21A2 : Tri année et nom                               *
      //%EMETADATA                                                     *
ctl-opt option(*srcstmt:*nodebugio);
dcl-f dsp21a2 workstn sfile(fmtenr:rrn); // DECLARATION DE SOUS FICHIER
dcl-s rrn packed(4);
dcl-f dvd;
dcl-ds array dim(*auto:100) qualified;
  titre like(titre);
  annee like(annee);
end-ds;


dow not *in03;
  setll 1 dvd;
  if %found;
    exsr rempli_sfl;
    if rrn <> 0;
      exsr dsp_page1;
      dow *in08 or *in09;
        if *in08 = *on;
          sorta(a) array %fields(annee);
          exsr sortfilm;
        endif;
        if *in09 = *on;
          sorta(a) array %fields(titre);
          exsr sortfilm;
        endif;
      enddo;
    endif;
    exsr clear_sfl;
  endif;
enddo;
*inlr = *on;

begsr sortfilm;
  exsr clear_sfl;
  exsr remp_sfl_w_arr;
  exsr dsp_page1;
endsr;

begsr rempli_sfl;
  *in08 = *off;
  *in09 = *off;
  read dvd;
  dow not %eof;
    rrn = rrn +1;
    anneef = annee;
    titref = titre;
    array(rrn).titre = titre;
    array(rrn).annee = annee;
    write fmtenr;
    read dvd;
  enddo;
  *in34 = *on;
endsr;

begsr remp_sfl_w_arr;
  for rrn = 1 to %elem(array);
    titref = array(rrn).titre;
    anneef = array(rrn).annee;
    write fmtenr;
  endfor;
endsr;

begsr dsp_page1;
  write touches; // N'ATTEND PAS D'ACTION DE L'UTILISATEUR
  exfmt fmtctl;  // ATTEND UNE ACTION DE L'UTILISATEUR
endsr;

begsr clear_sfl;
  reset rrn;
  *in30 = *on;
  write fmtctl;
  *in30 = *off;
endsr;

