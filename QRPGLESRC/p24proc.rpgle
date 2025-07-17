**free
      //%METADATA                                                      *
      // %TEXT Ex24A : Procedure externe age film                      *
      //%EMETADATA                                                     *
ctl-opt datfmt(*eur) nomain;

dcl-proc AgeFilm export;
  dcl-pi *n packed(3);
    year packed(4);
  end-pi;

  dcl-s currentYear like(year);
  dcl-s ageFilm like(year);

  currentYear = %subdt(%date():*y);
  ageFilm = currentYear - year;

  return ageFilm;
end-proc;

dcl-proc DureeFilm export;
  dcl-pi *n varchar(10);
    dureeparm packed(3);
  end-pi;
  dcl-s hour int(3);
  dcl-s minuteLeft int(3);
  dcl-s message varchar(20);

  hour = dureeparm / 60;
  minuteLeft = dureeparm - hour * 60;

  select ;
  when minuteLeft = 0;
    message =  %char(hour) + ' h';
  when minuteLeft >= 10;
    message =  %char(hour) + ' h ' + %char(minuteLeft) + ' mn';
  other;
     message =  %char(hour) + ' h 0' + %char(minuteLeft) + ' mn';
  endsl;






  return message;
end-proc;


