*** Settings ***
Library       SeleniumLibrary
Resource      Variables.robot

*** Keywords ***
Abrir navegador
    Open Browser    ${URL}  ${BROWSER}

Fechar navegador
    Close Browser

# Steps
Fazer login com o email "${email}" e senha "${senha}"no portal
    Title Should Be                         Login
    Wait Until Element Is Visible           xpath=//*[@id="Email"]
    Wait Until Element Is Visible           xpath=//*[@id="Password"]
    Input Text                              name=Email              ${emailadmin}
    Input Text                              name=Password           ${senhaadmin}
    Click Button                            xpath=/html/body/div[2]/div/div/div/div[2]/form/div[4]/div/button
    Wait Until Element Is Visible           xpath=//*[@id="root-navigation-container"]

Navegar até a tela de companies
    Go To                                   ${URL}
    Title Should Be                         Home
    Wait Until Element Is Visible           xpath=//*[@id="admin-btn"]
    Click Element                           xpath=//*[@id="EU Tax Reporting"]
    Wait Until Element Is Visible           xpath=//*[@id="Tools and Reports"]
    Click Element                           xpath=//*[@id="Settings"]
    Click Element                           xpath=//*[@id="Companies"]
    Wait Until Element Is Visible           xpath=//*[@id="content"]//*[contains(text(),"Create Company")]

# Conferir se o produto "${PRODUTO}" foi listado no site
#     Wait Until Element Is Visible   css=#center_column > h1
#     Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
#     Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]
#     Page Should Contain Element     xpath=//*[@id="columns"]//a[@class="home"]

# Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""
#     Wait Until Element Is Visible   css=#center_column > h1
#     Page Should Contain Element     xpath=//*[@id="center_column"]//*[@class="alert alert-warning"]