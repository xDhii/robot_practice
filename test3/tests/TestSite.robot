*** Settings ***
Resource                ../resource/Resource.robot
Test Setup              Abrir navegador
Test Teardown           Fechar navegador

*** Test Case ***
Fazer login no sistema e deslogar em seguida
        Fazer login no portal
        Deslogar do portal

Criar uma nova company e deletar em seguida
        Fazer login no portal
        Navegar até a tela de companies
        Uma vez na tela de companies, criar uma company
        Encontrar e deletar a company criada

Criar uma administration
        Fazer login no portal
        Navegar até a tela de companies
        Uma vez na tela de companies, criar uma company
        Entrar na company criada
        Criar administration