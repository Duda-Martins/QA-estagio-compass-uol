*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Keywords ***
Setar usuário e senha
    Set Test Variable    ${username}    admin
    Set Test Variable    ${senha_aleatoria}    password123

Realizar a autenticação
    [Arguments]    ${username}    ${senha_aleatoria}    ${status_code_desejado}
    ${body}    Create Dictionary
    ...    username=${username}
    ...    password=${senha_aleatoria}

    ${header}    Create Dictionary
    ...    Content-Type=application/json

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

Criar Sessão
    Create Session    alias=restful-booker    url=https://restful-booker.herokuapp.com

Verificar se tem o status code correto
    [Arguments]    ${status_sucesso}
    Status Should Be    ${status_sucesso}

Verificar se o token foi enviado
    Dictionary Should Contain Key   ${RESPOSTA}  token

Guardar o token
    Set Suite Variable    ${TOKEN}    ${resposta}[token]