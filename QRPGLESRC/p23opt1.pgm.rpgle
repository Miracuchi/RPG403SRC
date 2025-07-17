**free
      //%METADATA                                                      *
      // %TEXT Ex23D : Procédures internes palindrome                  *
      //%EMETADATA                                                     *
//ctl-opt actgrp(*new);

dcl-enum exemples;
  ex1 'REPASSER';
  ex2 'RESSASSER';
  ex3 'BOB';
  ex4 'IBMmbi';
  ex5 'KAY    A       K';
  ex6 'HANNAh';
  ex7 'La mariée    ira mal';
end-enum;
dcl-s mot varchar(30);
dcl-s listePalindromes varchar(30) dim(*auto:20);

for-each mot in exemples;
  if verifPalindrome(mot) = *on;
    listePalindromes(*next) = mot;
  endif;
endfor;

sorta(a) listePalindromes;
for-each mot in listePalindromes;
  dsply mot;
endfor;

*inlr = *on;

dcl-proc verifPalindrome;
  dcl-pi *n ind;
    mot varchar(30);
  end-pi;
  dcl-s motNettoye like(mot);
  dcl-s isPalindrome ind;
  dcl-s min uns(3) inz(1);
  dcl-s max uns(3) inz(0);
  isPalindrome = *off;
  motNettoye = mot;
  motNettoye = %xlate('éèêëàâäîïôöûüùçÉÈÊËÀÂÄÎÏÔÖÛÜÙÇ':'eeeeaaaiioouuucEEEEAAAIIOOUUUC':motNettoye);

  motNettoye = %scanrpl(' ':'':motNettoye);
  reset min;
  reset max;
  max = %len(motNettoye);
  dow min < max and %subst(motNettoye:min:1) = %subst(motNettoye:max:1);
    min += 1 ;
    max -= 1 ;
  enddo ;

  if %lower(%subst(motNettoye:min:1)) = %lower(%subst(motNettoye:max:1));
    isPalindrome = *on;
  endif;
  return isPalindrome;
end-proc;

