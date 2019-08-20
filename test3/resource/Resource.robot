*** Settings ***
Resource      Variables.robot

*** Keywords ***
Abrir navegador
    Open Browser    ${URL}  ${BROWSER}

Fechar navegador
    Close Browser

# Steps
Fazer login com o email "${email}" e senha "${senha}"no portal
    Title Should Be                         ${logintitle}
    Wait Until Element Is Visible           xpath=//*[@id="Email"]
    Wait Until Element Is Visible           xpath=//*[@id="Password"]
    Input Text                              name=Email                          ${emailadmin}
    Input Text                              name=Password                       ${senhaadmin}
    Click Button                            xpath=/html/body/div[2]/div/div/div/div[2]/form/div[4]/div/button
    Wait Until Element Is Visible           xpath=//*[@id="root-navigation-container"]

Navegar até a tela de companies
    Go To                                   ${URL}
    Title Should Be                         ${hometitle}
    Wait Until Element Is Visible           xpath=//*[@id="admin-btn"]
    Click Element                           xpath=//*[@id="EU Tax Reporting"]
    Wait Until Element Is Visible           xpath=//*[@id="Tools and Reports"]
    Click Element                           xpath=//*[@id="Settings"]
    Click Element                           xpath=//*[@id="Companies"]
    Wait Until Element Is Visible           xpath=//*[@id="content"]//*[@class="btn btn-primary btn-create"]

Uma vez na tela de companies, criar uma company
    Generate Banana String
    Click Element                           xpath=//*[@id="content"]//*[@class="btn btn-primary btn-create"]
    Input Text                              xpath=//*[@id="LegalName"]          ${TOKEN1}
    Input Text                              xpath=//*[@id="AbbreviatedName"]    ${TOKEN2}
    Wait Until Element Is Visible           xpath=//*[@id="content"]/app/main/view-rules/div[2]/div/div/div[3]/div/button

# Encontrar a company criada
#     ${company_locator}=    Get Company Locator    teste
#     Wait Until Keyword Succeeds    10 sec    10 sec     Click Button    ${company_locator}
#     Click Element                           xpath=//*[@id="tblCompanies"]//*[@class="k-grid-content"]//*[@role="grid"]//*[@role="rowgroup"]//*[td="${nomecompanyfull}"]

Generate Banana String
    ${token_locator1}=          Generate Random String  8  [NUMBERS]
    ${token_locator2}=          Generate Random String  2  [NUMBERS]
    Set Global Variable         ${TOKEN1}           ${token_locator1}
    Set Global Variable         ${TOKEN2}           ${token_locator2}
    Log to Console              ${TOKEN1}
    Log to Console              ${TOKEN2}