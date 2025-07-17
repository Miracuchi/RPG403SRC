**free

// RPG BATTLE DEV 2024 - Manche 3 - Epreuve 3 - 19 Novembre 2024

// Contexte :
//  Recherche de bug

// Objectif :
//  Corriger le problème pour que le code fonctionne
//   Le programme affiche actuellement : DSPLY     2
//   Après correction il doit afficher : DSPLY     RPG BATTLE DEV 2024!

// Consignes :
//  1. Utiliser uniquement des instructions RPG natives (pas de SQL, pas d'appels d'API ...)
//  2. Les déclarations ne doivent pas être modifiées
//  3. Les lignes déjà présentes dans le code ne doivent pas êtres supprimées

// Critères d'évaluation :
//  1. Le résultat doit être celui demandé
//  2. Le programme doit s'appeler E5 dans votre bibliothèque TEAMx

// -----------------------------------------------------------------------------
// Votre profil IBM i : TEAMXX
// -----------------------------------------------------------------------------

ctl-opt actgrp(*new);

dcl-s contenu varchar(100) inz('IBM:COMMON FRANCE::2024::rpg battle dev 2024!:Edition:2');

dsply procsplit(contenu);

return ;

dcl-proc procSplit;
   dcl-s resSplit varchar(20) dim(10);
   dcl-c ind const(6);

   dcl-pi *n varchar(20);
      p_entry varchar(100);
   End-pi;

   resSplit = %upper(%split(contenu : ':' : *allsep));
   return resSplit(ind);

End-proc;

