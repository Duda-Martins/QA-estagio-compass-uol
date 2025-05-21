*** Settings ***
Resource  ../resources/aunth_tests.resource

*** Test Cases ***
Cenário 01 Login com sucesso
    Setar usuário e senha
    Realizar a autenticação    ${username}    ${senha_aleatoria}    200
    Verificar se deu sucesso 200
    Verificar se o token foi enviado
    Guardar o token