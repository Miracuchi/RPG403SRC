**free

dcl-pi *n;
    id_anip int(10);
end-pi;
dcl-s message varchar(52);
dcl-s nom varchar(25);
dcl-s prenom varchar(20);


exec sql declare c1 cursor for select p.nom, p.prenom from personne p
    inner join adoption ad on p.id_per = ad.id_per
    inner join animal an on ad.id_ani = an.id_ani
    where an.id_ani = :id_anip;
exec sql open c1;


exec sql fetch from c1 into :nom, :prenom;
dow sqlcod = 0;
    message = %trim(nom) + ' ' + %trim(prenom);
    dsply message;
    exec sql fetch from c1 into :nom, :prenom;
enddo;
exec sql close c1;



*inlr = *on;




