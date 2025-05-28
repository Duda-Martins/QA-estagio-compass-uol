*** Settings ***
Documentation    Test suite for authentication functionality.
...              Verifies the API's authentication process by testing:
...              - User login with valid credentials
...              - Token generation and validation
Resource  ../resources/aunth_tests.resource

*** Test Cases ***
Cenário 01 Login com sucesso
    [Documentation]    Tests successful login with valid credentials
    ...               Verifies that:
    ...               - Authentication returns 200 status code
    ...               - A valid token is received
    Setar usuário e senha
    Realizar a autenticação    ${username}    ${senha_aleatoria}    200
    Verificar se tem o status code correto    200
    Verificar se o token foi enviado
    Guardar o token