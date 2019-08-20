*** Settings ***
Library             SeleniumLibrary
Library             String
Library             BuiltIn

*** Variables ***
${URL}              http://qavat2.sovos.com/
${BROWSER}          chrome
${hometitle}        Home
${logintitle}       Login
${emailadmin}       adriano@test
${senhaadmin}       Sovos123!
# ${nomecompanyfull}  Company_${TOKEN}
# ${nomecompanyabr}   CP_${TOKEN}


Get Company Locator
    [Arguments]    ${company}
    ${company_loc}    Set Variable    xpath=//td[contains(text(),'${company}')]
    [Return]    ${company_loc}