*** Settings ***

Resource  ../Ressources/signBack.robot
Resource  ../Ressources/variables.robot

*** Test Cases ***
Inscrire un utilisteur dans la BD
    [Tags]  first 
    signBack.Verifier si user existe dans BD
    signBack.Inscription utilisateur par une requete post
    signBack.Verifier que user est ajouter dans la BD