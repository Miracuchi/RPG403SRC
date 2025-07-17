**free

// RPG BATTLE DEV 2023 - Manche 3 - Epreuve 5 - 21 juin 2023

// Contexte :
//  Recherche de bug sur test d'une date

// Objectif :
//  Corriger le problème pour que le code fonctionne
//   - Le programme affiche actuellement : DSPLY   Erreur : Z1A n'est pas au format JOUR.MOIS.ANNEE
//   - Après correction il doit afficher : DSPLY   Z1A est au format JOUR.MOIS.ANNEE


// Consignes :
//  1. Vous ne devez modifier qu'une seule ligne de code
//  2. Vous ne devez pas ajouter ou supprimer de lignes

// Critères d'évaluation :
//  1. Le résultat doit être celui demandé
//  2. Le programme doit s'appeler E5 dans votre bibliothèque TEAMxx

// ------------------------------------------------------------------------------------------------
// Votre profil IBM i : TEAMxx
// ------------------------------------------------------------------------------------------------

dcl-s z1a char(8) inz('21.06.23');

test(de) *dmy. z1a;

if %error;
  dsply 'Erreur : Z1A n''est pas au format JOUR.MOIS.ANNEE';
else;
  dsply 'Z1A est au format JOUR.MOIS.ANNEE';
endif;

return;

