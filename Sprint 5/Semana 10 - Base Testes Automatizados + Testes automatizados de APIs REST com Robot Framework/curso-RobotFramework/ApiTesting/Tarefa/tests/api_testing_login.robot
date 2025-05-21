*** Settings ***
Resource    ../resources/api_testing_login.resource

*** Test Cases ***
Cenário 04: Logar com o novo usuário criado
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Realizar Login com o usuário    email=${EMAIL_TESTE}  status_code_desejado=200
    Conferir se o Login ocorreu com sucesso