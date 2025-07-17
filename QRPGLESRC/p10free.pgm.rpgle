**free
      //%METADATA                                                      *
      // %TEXT Ex10  : Fichiers BDD Passage de paramètres              *
      //%EMETADATA                                                     *
dcl-f dvd keyed;
dcl-s charCodeRecu varchar(5);
dcl-s msg char(52);
dcl-s cle zoned(5);

dcl-pi *n;
  codeRecu packed(15:5) const;
end-pi;

cle = codeRecu;
chain cle dvd;
charCodeRecu = %trim(%char(cle));

if %found;
msg =  'Film ' + charCodeRecu + ' - Titre : ' + %trim(titre);
  dsply %trim(msg);
else;
  dsply ('Film ' + charCodeRecu + ' non trouvé');
endif;

*inlr = *on;
