*** Settings ***
Documentation    Keywords para o endpoint /usuarios.
Resource    ../common/common.robot

*** Keywords ***

Enviar requisição POST para /usuarios
    ${resposta}  POST On Session
        ...          alias=restful-serverest
        ...          url=/usuarios
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}

        Set Test Variable    ${RESPOSTA}    ${resposta.json()}
        Log    ${RESPOSTA}
        Log to Console    ${RESPOSTA}

Enviar requisição PUT para /usuarios/_id
    ${resposta}  PUT On Session
        ...          alias=restful-serverest
        ...          url=/usuarios/${ID_INEXISTENTE}
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}

        Set Test Variable    ${RESPOSTA}    ${resposta.json()}
        Log    ${RESPOSTA}
        Log to Console    ${RESPOSTA}