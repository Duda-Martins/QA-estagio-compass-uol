*** Settings ***
Documentation    Resource file containing authentication related keywords and variables.
...              Provides functionality for user authentication, token management,
...              and session creation for the Restful-Booker API.
Library  RequestsLibrary
Library  Collections
Resource  common/common_variables.resource
Resource  common/common_keywords.resource

*** Keywords ***
Setar usuário e senha
    [Documentation]    Sets up test variables for username and password
    Set Test Variable    ${username}    ${DEFAULT_USERNAME}
    Set Test Variable    ${senha_aleatoria}    ${DEFAULT_PASSWORD}

Realizar a autenticação
    [Documentation]    Performs authentication with the API using provided credentials
    ...               Args:
    ...               - username: The user's login name
    ...               - senha_aleatoria: The user's password
    ...               - status_code_desejado: Expected HTTP status code
    [Arguments]    ${username}    ${senha_aleatoria}    ${status_code_desejado}
    ${body}    Create Dictionary
    ...    username=${username}
    ...    password=${senha_aleatoria}

    ${header}    Create Dictionary
    ...    Content-Type=${CONTENT_TYPE_JSON}

    Criar Sessão

    ${resposta}  POST On Session
    ...          alias=restful-booker
    ...          url=/auth
    ...          json=${body}
    ...          expected_status=${status_code_desejado}
    ...          headers=${header}

    Log    ${resposta.json()}
    Log to Console    ${resposta.json()}


    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log  ${RESPOSTA}

Verificar se o token foi enviado
    [Documentation]    Verifies if the authentication response contains a token
    Dictionary Should Contain Key   ${RESPOSTA}  token

Guardar o token
    [Documentation]    Stores the authentication token as a suite variable
    Set Suite Variable    ${TOKEN}    ${resposta}[token]