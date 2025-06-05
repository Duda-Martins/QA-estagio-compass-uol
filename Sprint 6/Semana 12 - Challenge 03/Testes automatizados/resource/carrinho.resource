*** Settings ***
Documentation    Keywords para o endpoint /carrinhos.
Resource    ../common/common.robot

*** Keywords ***

Criar um carrinho
    Autenticar usuário autorizado e obter token
    Preparar massa de dados CT024
    Enviar requisição POST para /carrinhos

Enviar requisição POST para /carrinhos
    ${resposta}  POST On Session
        ...          alias=restful-serverest
        ...          url=/carrinhos
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

        Set Test Variable    ${RESPOSTA}    ${resposta.json()}
        Log    ${RESPOSTA}
        Log to Console    ${RESPOSTA}

Enviar requisição DELETE para /carrinhos/concluir-compra
    ${resposta}  DELETE On Session
        ...          alias=restful-serverest
        ...          url=/carrinhos/concluir-compra
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

        Set Test Variable    ${RESPOSTA}    ${resposta.json()}
        Log    ${RESPOSTA}
        Log to Console    ${RESPOSTA}

Enviar requisição DELETE para /carrinhos/cancelar-compra
    ${resposta}  DELETE On Session
        ...          alias=restful-serverest
        ...          url=/carrinhos/cancelar-compra
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

        Set Test Variable    ${RESPOSTA}    ${resposta.json()}
        Log    ${RESPOSTA}
        Log to Console    ${RESPOSTA}