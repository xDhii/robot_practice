*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${URL}          http://automationpractice.com/index.php
${BROWSER}      chrome


*** Keywords ***
Abrir Navegador
  Open Browser    about:blank     ${BROWSER}

Fechar Navegador
    Close Browser

Dado que estou na pagina home do Site
  Go To    ${URL}
  Title Should Be    My Store

Quando eu pesquisar pelo produto "${PRODUTO}"
  Input Text    name=search_query    ${PRODUTO}
  Click Element    name=submit_search

Entao o produto "${PRODUTO}" deve estar listado na pagina de resultado de busca
  Element Should Contain    css=#center_column > h1    SEARCH   "${PRODUTO}"
  Title Should Be    Search - My Store
