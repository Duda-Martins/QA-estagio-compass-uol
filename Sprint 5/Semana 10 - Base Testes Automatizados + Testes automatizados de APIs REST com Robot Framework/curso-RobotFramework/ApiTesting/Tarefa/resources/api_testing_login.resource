*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections

*** Keywords ***
Criar um usuário novo
    ${palavra_aleatoria}  Generate Random String  length=4  chars=[LETTERS]
    ${palavra_aleatoria}  Convert To Lower Case   ${palavra_aleatoria}
    Set Test Variable     ${EMAIL_TESTE}  ${palavra_aleatoria}@emailteste.com
    Log  ${EMAIL_TESTE}

Cadastrar o usuário criado na ServeRest
    [Arguments]  ${email}  ${status_code_desejado}
    ${body}  Create Dictionary
    ...      nome=Fulano da Silva
    ...      email=${email}
    ...      password=1234
    ...      administrador=true
    Log   ${body}
    
    Criar Sessão na ServeRest

    ${resposta}  POST On Session
    ...          alias=ServeRest
    ...          url=/usuarios
    ...          json=${body}
    ...          expected_status=${status_code_desejado}

    Log  ${resposta.json()}
    
    IF  ${resposta.status_code} == 201
        Set Test Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}
    END

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Criar Sessão na ServeRest
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev   headers=${headers}

Realizar Login com o usuário
    [Arguments]  ${email}    ${status_code_desejado}
    ${body}  Create Dictionary
    ...      email=${email}
    ...      password=1234

    ${resposta_login}  POST On Session
    ...          alias=ServeRest
    ...          url=/login
    ...          json=${body}
    ...          expected_status=${status_code_desejado}

    Set Test Variable    ${RESPOSTA_LOGIN}    ${resposta_login.json()}

Conferir se o Login ocorreu com sucesso
    Log  ${RESPOSTA_LOGIN}
    Dictionary Should Contain Item  ${RESPOSTA_LOGIN}  message  Login realizado com sucesso
    Dictionary Should Contain Key   ${RESPOSTA_LOGIN}  authorization