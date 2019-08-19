*** Settings ***
Resource  ../resource/pesquisar_kw.robot
Suite Setup   Abrir Navegador
Suite Teardown  Fechar Navegador
Force Tags  pesquisar

#Test Setup Abrir Navegador
#Test teardown  Fechar Navegador

*** Variables ***
  #Para criar variáveis
*** Test Case ***

Caso de teste 01: Pesquisar produto existente
  #[Tags] pesquisar_existente
  Dado que estou na pagina home do Site
  Quando eu pesquisar pelo produto "Blouse"
  Entao o produto "Blouse" deve estar listado na pagina de resultado de busca
*** Keywords ***
  #Para implementar os cenários
