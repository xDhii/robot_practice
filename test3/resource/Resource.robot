*** Settings ***
Resource      Variables.robot

*** Keywords ***
Abrir navegador
    Open Browser    ${URL}  ${BROWSER}

Fechar navegador
    Close Browser

# Steps
Fazer login no portal
    Title Should Be                         ${logintitle}
    Wait Until Element Is Visible           xpath=//*[@id="Email"]
    Wait Until Element Is Visible           xpath=//*[@id="Password"]
    Input Text                              name=Email                          ${emailadmin}
    Input Text                              name=Password                       ${senhaadmin}
    Click Button                            xpath=/html/body/div[2]/div/div/div/div[2]/form/div[4]/div/button
    Wait Until Element Is Visible           xpath=//*[@id="root-navigation-container"]
    Wait Until Element Is Visible           xpath=//*[@id="EU Tax Reporting"]
    Click Element                           xpath=//*[@id="EU Tax Reporting"]

Deslogar do portal
    Click Element                           xpath=//*[@id="edit-profile-btn"]
    Wait Until Element Is Visible           xpath=//*[@id="logout"]//*[div]//*[div]/div[contains(text(), 'Logout')]
    Click Element                           xpath=//*[@id="logout"]//*[div]//*[div]/div[contains(text(), 'Logout')]
    Wait Until Element Is Visible           xpath=//*[@id="Email"]
    Wait Until Element Is Visible           xpath=//*[@id="Password"]
    Title Should Be                         ${logintitle}

Navegar até a tela de companies
    Go To                                   ${URL}
    Title Should Be                         ${hometitle}
    Wait Until Element Is Visible           xpath=//*[@id="Tools and Reports"]
    Click Element                           xpath=//*[@id="Settings"]
    Click Element                           xpath=//*[@id="Companies"]
    Wait Until Element Is Visible           xpath=//*[@id="content"]//*[@class="btn btn-primary btn-create"]

Uma vez na tela de companies, criar uma company
    Generate Company String
    Click Element                           xpath=//*[@id="content"]//*[@class="btn btn-primary btn-create"]
    Input Text                              xpath=//*[@id="LegalName"]          ${companynamefull}
    Input Text                              xpath=//*[@id="AbbreviatedName"]    ${companynameabr}
    Click Element                           xpath=//*[@id="content"]/div[3]/form/div[3]//*[@class="btn btn-primary"]
    Wait Until Element Is Visible           xpath=//*[@id="content"]/app/main/view-rules/div[2]/div/div/div[3]/div/button

Encontrar e deletar a company criada
    Navegar até a tela de companies
    Wait Until Element Is Visible           xpath=//*[@id="tblCompanies"]//*[@class="k-grid-content"]//*[@role="grid"]//*[@role="rowgroup"]//*[td="${companynamefull}"]//*[@class='delete-cell']//*[@class='badge badge-important']//*[@class='icon-remove icon-white']
    Click Element                           xpath=//*[@id="tblCompanies"]//*[@class="k-grid-content"]//*[@role="grid"]//*[@role="rowgroup"]//*[td="${companynamefull}"]//*[@class='delete-cell']

Entrar na company criada
    Wait Until Element Is Visible           xpath=//*[@id="tblCompanies"]//*[@class="k-grid-content"]//*[@role="grid"]//*[@role="rowgroup"]//*[td="${companynamefull}"]
    Click Element                           xpath=//*[@id="tblCompanies"]//*[@class="k-grid-content"]//*[@role="grid"]//*[@role="rowgroup"]//*[td="${companynamefull}"]
    Wait Until Element Is Visible           xpath=//*[@id="content"]/app/main/view-rules/div[2]/div/div/div[3]/div/button

Criar administration
    Click Element                           xpath=//*[@id="content"]/app/main/view-rules/div[2]/div/div/div[3]/div/button
    Wait Until Element Is Visible           xpath=//*[@id="undefined-undefined-AdministrationType-45081"]
    Click Element                           xpath=//*[@id="undefined-undefined-Country-43038"]/div[1]/div[2]
    Click Element                           xpath=/html/body/div[7]/div/div/div/div[208]/span/div/div/div
    Click Element                           xpath=/html/body/div[7]/div/div/div/div[2]/span/div/div/div
    Input Text                              xpath=//*[@id="VATNumber"]          ${vatnumber}
    Click Element                           xpath=//*[@id="undefined-undefined-VATNumberType-59514"]/div[1]/div[2]
    Click Element                           xpath=/html/body/div[7]/div/div/div/div[2]/span/div/div/div
    Input Text                              xpath=//*[@id="CompanyCode"]        ${companycode}
    Input Text                              xpath=//*[@id="ApplicantFullName"]  ${companyfullname}
    Input Text                              xpath=//*[@id="ApplicantEmail"]     ${email}

Generate Company String
    ${token_locator1}=          Generate Random String  8  [NUMBERS]
    ${token_locator2}=          Generate Random String  3  [NUMBERS]
    Set Global Variable         ${companynamefull}          Company_${token_locator1}
    Set Global Variable         ${companynameabr}           Company_${token_locator2}
    Log to Console              ${companynamefull}
    Log to Console              ${companynameabr}