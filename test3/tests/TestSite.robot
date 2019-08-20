*** Settings ***
Resource          ../resource/Resource.robot
Test Setup       Abrir navegador
Test Teardown     Fechar navegador

*** Test Case ***
Criar uma nova company
        Fazer login com o email "adriano@test" e senha "Sovos123!"no portal
        Navegar até a tela de companies

*** Keywords ***
