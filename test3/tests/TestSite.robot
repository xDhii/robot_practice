*** Settings ***
Resource                ../resource/Resource.robot
Test Setup              Abrir navegador
Test Teardown           Fechar navegador

*** Test Case ***
# Fazer login no sistema
#         Fazer login com o email "${emailadmin}" e senha "${senhaadmin}!"no portal

Criar uma nova company
        # ${TOKEN} =  Generate Random String  8  [NUMBERS]
        Fazer login com o email "${emailadmin}" e senha "${senhaadmin}!"no portal
        Navegar até a tela de companies
        Uma vez na tela de companies, criar uma company

# Criar uma administration
#         Fazer login com o email "${emailadmin}" e senha "${senhaadmin}!"no portal
#         Navegar até a tela de companies
#         Encontrar a company criada
# Editar a company criada
#         Navegar até a tela de companies