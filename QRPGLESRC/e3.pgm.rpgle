**free

// RPG BATTLE DEV 2023 - Manche 2 - Epreuve 3 - Du 14 au 16 juin 2023

// Contexte :
//  Recherche de bug

// Objectif :
//  - Corriger le problème pour que le code fonctionne
//  - Le programme doit afficher le contenu du fichier TEAMLIB/PERSONNAGE,
//    ainsi que le nombre de personnes
//  - Actuellement le programme affiche :
//     DSPLY  Id : 1, ,
//     DSPLY  Id : 2, ,
//     DSPLY  Id : 3, ,
//     DSPLY  Id : 4, ,
//     DSPLY  4 personnages

// Consignes :
//  1. Utiliser uniquement des instructions RPG natives (pas de SQL, pas d'appels d'API ...)
//  2. Les lignes déjà présentes dans le code peuvent être modifiées
//  3. Les lignes déjà présentes dans le code ne doivent pas êtres supprimées

// Critères d'évaluation :
//  1. Le résultat doit être celui demandé
//  2. Le programme doit s'appeler E3 dans votre bibliothèque TEAMxx

// ------------------------------------------------------------------------------------------------
// Votre profil IBM i : TEAMxx
// ------------------------------------------------------------------------------------------------

ctl-opt actgrp(*new) alwnull(*no);

dcl-f personnage disk keyed ;
dcl-ds perso extname('PERSONNAGE':*input) qualified ;
end-ds ;
dcl-s i int(5) inz ;
dcl-s msg52 varchar(52) inz ;


read personnage perso ;
dow not %eof(personnage) ;
  i+=1;
  msg52 = 'Id : ' + %char(i) + ', ' + %trim(perso.nom) + ', ' + %trim(perso.prenom) ;
  dsply msg52 ;
  read personnage perso ;
enddo ;
if i = 0 ;
  dsply 'Aucun personnage !' ;
else ;
  dsply (%char(i) + ' personnages') ;
endif ;

return ;

