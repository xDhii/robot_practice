*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${URL}            http://automationpractice.com
${BROWSER}        chrome

*** Keywords ***
Abrir navegador
    Open Browser    ${URL}  ${BROWSER}

Fechar navegador
    Close Browser

#### Steps
Acessar a página home do site
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de Pesquisar
    Input Text                      name=search_query    ${PRODUTO}

Clicar no botão Pesquisar
    Click Button                    name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible   css=#center_column > h1
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]
    Page Should Contain Element    locator
