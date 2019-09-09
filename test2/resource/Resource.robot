*** Settings ***
Library         SeleniumLibrary
Library         DiffLibrary
Library         OperatingSystem

*** Variables ***
${URL}            http://automationpractice.com
${BROWSER}        chrome

*** Keywords ***
Comparar dois arquivos
    Set Suite Variable      ${RESOURCEDIR}        ${CURDIR}
    ${arquivo1}   Normalize Path         ${RESOURCEDIR}\\arquivo1.xlsx
    ${arquivo2}   Normalize Path         ${RESOURCEDIR}\\arquivo2.xlsx
    ${arquivo3}   Normalize Path         ${RESOURCEDIR}\\arquivo1.txt
    ${arquivo4}   Normalize Path         ${RESOURCEDIR}\\arquivo2.txt
    ${arquivo5}   Normalize Path         ${RESOURCEDIR}\\arquivo3.txt
    ${arquivo6}   Normalize Path         ${RESOURCEDIR}\\arquivo4.txt
    Diff Files  ${arquivo1}  ${arquivo2}  fail=True
    Diff Files  ${arquivo3}  ${arquivo4}  fail=True
    Diff Files  ${arquivo5}  ${arquivo6}  fail=True

Abrir navegador
    Open Browser    ${URL}  ${BROWSER}

Fechar navegador
    Close Browser

# Steps
Acessar a página home do site
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de Pesquisar
    Wait Until Element is Visible   xpath=//*[@id="search_query_top"]
    Input Text                      name=search_query    ${PRODUTO}

Clicar no botão Pesquisar
    Click Button                    name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible   css=#center_column > h1
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]
    Page Should Contain Element     xpath=//*[@id="columns"]//a[@class="home"]

Digitar o nome do produto "ItemNaoExistente" no campo de Pesquisar
    Wait Until Element is Visible   xpath=//*[@id="search_query_top"]
    Input Text                      name=search_query    ItemNaoExistente

Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""
    Wait Until Element Is Visible   css=#center_column > h1
    Page Should Contain Element     xpath=//*[@id="center_column"]//*[@class="alert alert-warning"]