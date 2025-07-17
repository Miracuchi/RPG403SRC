**free
      //%METADATA                                                      *
      // %TEXT Statistiques des sinistres                              *
      //%EMETADATA                                                     *
ctl-opt option(*nodebugio:*srcstmt:*nounref);

dcl-f pi_sin1d workstn;
dcl-f clients keyed;
dcl-f sinistres keyed;
dcl-f contrats keyed;

dcl-s numclients zoned(2) dim(*auto:20);
dcl-c z1 2024;
dcl-s i zoned(3);
dcl-s j like(i);
dcl-s cnt like(numclients) dim(*auto:20);
dcl-s mxcnt like(i);
dcl-s res like(cli_num);

dow not *in03;
  exsr nbclients;
  exsr liblsin;
  exsr nbContrats;
  exfmt record1;
enddo;
*inlr = *on;

// Phase 1 du MCU
begsr nbclients;
  setll *start clients;
  nbcli = 0;
  read clients;
  dow not %eof;
    nbcli = nbcli + 1;
    read clients;
  enddo;
endsr;

// Phase 2 du MCU
begsr liblsin;
  setll *start sinistres;
  chain z1 sinistres;
  if %found;
    descsin = sin_desc;
  endif;
endsr;

// Phase 3 du MCU
begsr nbContrats;
  %elem(numclients) = 0; // TOUJOUR REMETTRE LES TABLEAU A 0
  %elem(cnt) = 0;  // TOUJOUR REMETTRE LES TABLEAU A 0

  // Lecture des contrats et alimentation du tableau des numéro de client à partir des contrats
  setll *start contrats;
  read contrats;
  i = 1;
  dow not %eof;
    numclients(i) = cli_num;
    i = i + 1;
    read contrats;
  enddo;

  // Récupération du numéro client avec le plus d'occurence
  sorta(a) numclients;
  for i = 1 TO %elem(numclients);
    cnt(i) = 0;
    for j = 1 to %elem(numclients);
      if numclients(i) = numclients(j);
        cnt(i)= cnt(i) + 1;
      endif;
    endfor;
  endfor;

  // Récupération du numéro de client le plus présent et le nombre de fois
  mxcnt = 0;
  res = 0;
  for i = 1 to %elem(numclients);
    if cnt(i) > mxcnt;
      res = numclients(i);
      mxcnt = cnt(i);
    endif;
  endfor;

  // Alimentation des variable du DSPF
  setll *start clients;
  chain res clients;
  if %found;
    nompre = %trim(cli_nom) + ' ' + %trim(cli_pre);
    NBMAXCTCLI = mxcnt;
  endif;
endsr;



