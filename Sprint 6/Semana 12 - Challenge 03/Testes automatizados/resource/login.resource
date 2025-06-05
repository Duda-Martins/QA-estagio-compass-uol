*** Settings ***
Documentation    Keywords para o endpoint /login.
Resource    ../common/common.robot
Library    String

*** Keywords ***

Salvar Token
    ${token}=   Get From Dictionary    ${RESPOSTA}    authorization
    ${token_parte}    Split String    ${token}    ${SPACE}
    Set Test Variable    ${TOKEN}    ${token_parte}[1]

    Log    ${TOKEN}
    Log To Console    ${TOKEN}

Enviar requisição POST para /login
    ${resposta}  POST On Session
        ...          alias=restful-serverest
        ...          url=/login
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}

        Set Test Variable    ${RESPOSTA}    ${resposta.json()}
        Log    ${RESPOSTA}
        Log to Console    ${RESPOSTA}