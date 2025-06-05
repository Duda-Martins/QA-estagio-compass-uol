*** Settings ***
Documentation    Keywords para o endpoint /produtos.
Resource    ../common/common.robot

*** Keywords ***

Autenticar usuário autorizado e obter token
    Preparar massa de dados CT013
    Enviar requisição POST para /login
    Salvar Token

Autenticar usuário comum e obter token
    Preparar massa de dados CT035
    Enviar requisição POST para /login
    Salvar Token

Enviar requisição para GET /produtos
    ${resposta}  GET On Session
        ...          alias=restful-serverest
        ...          url=/produtos
        ...          expected_status=${STATUS_REQ}

        Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Enviar requisição POST para /produtos
    ${resposta}  POST On Session
        ...          alias=restful-serverest
        ...          url=/produtos
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

        Set Test Variable    ${RESPOSTA}    ${resposta.json()}
        Log    ${RESPOSTA}
        Log to Console    ${RESPOSTA}

Enviar requisição PUT para /produtos/_id
    ${resposta}  PUT On Session
        ...          alias=restful-serverest
        ...          url=/produtos/${ID_INEXISTENTE}
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

        Set Test Variable    ${RESPOSTA}    ${resposta.json()}
        Log    ${RESPOSTA}
        Log to Console    ${RESPOSTA}