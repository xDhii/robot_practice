*** Settings ***
Resource          ../resource/Resource.robot
Resource          ../resource/Variables.robot
Test Setup       Abrir navegador
Test Teardown     Fechar navegador

*** Test Case ***
Criar uma nova company
        Fazer login com o email "${emailadmin}" e senha "${senhaadmin}!"no portal
        Navegar até a tela de companies
