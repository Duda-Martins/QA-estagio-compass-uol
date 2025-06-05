*** Settings ***
Documentation    Variáveis para o endpoint /carrinhos.
Resource    ../../common/common.robot

*** Keywords ***

Preparar massa de dados CT024

    Preparar massa de dados CT037
    Enviar requisição POST para /produtos

    ${idProduto1}=    Get From Dictionary    ${RESPOSTA}    _id
    ${qtdProduto1}=   Get From Dictionary    ${body}    quantidade

    Preparar massa de dados CT037
    Enviar requisição POST para /produtos

    ${idProduto2}=    Get From Dictionary    ${RESPOSTA}    _id
    ${qtdProduto2}=   Get From Dictionary    ${body}    quantidade

    ${produto1}=    Create Dictionary
    ...         idProduto=${idProduto1}
    ...         quantidade=${qtdProduto1}

    ${produto2}=    Create Dictionary
    ...         idProduto=${idProduto2}
    ...         quantidade=${qtdProduto2}

    ${produtos}=    Create List    ${produto1}    ${produto2}

    ${body}=    Create Dictionary
    ...         produtos=${produtos}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    Set Test Variable    ${body}
    Set Test Variable    ${headers}