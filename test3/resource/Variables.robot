*** Settings ***
Library             SeleniumLibrary
Library             String
Library             BuiltIn

*** Variables ***
${URL}              http://qavat2.sovos.com/
${BROWSER}          headlesschrome
${hometitle}        Home
${logintitle}       Login
${emailadmin}       adriano@test
${senhaadmin}       Sovos123!
${vatnumber}        N0030145G
${companycode}      Smoke_Test
${companyfullname}  Empresa_Smoke_Test
${email}            adriano.valumin@sovos.com