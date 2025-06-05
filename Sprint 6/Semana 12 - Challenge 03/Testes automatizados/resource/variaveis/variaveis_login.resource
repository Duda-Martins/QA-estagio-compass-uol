*** Settings ***
Documentation    Variáveis para o endpoint /login.
Resource    ../../common/common.robot

*** Keywords ***

Preparar massa de dados CT011

    ${email}=   FakerLibrary.Company Email

    ${body}=    Create Dictionary
    ...         email=${email}
    ...         password=${SENHA_PADRAO}

    Set Test Variable    ${body}

Preparar massa de dados CT012
    Preparar massa de dados CT001
    Enviar requisição POST para /usuarios

    ${body}=    Create Dictionary
    ...         email=${email}
    ...         password=36828

    Set Test Variable    ${body}

Preparar massa de dados CT013
    Preparar massa de dados CT001
    Enviar requisição POST para /usuarios

    ${body}=    Create Dictionary
    ...         email=${email}
    ...         password=${SENHA_PADRAO}

    Set Test Variable    ${body}

Preparar massa de dados CT035
    Preparar massa de dados CT034
    Enviar requisição POST para /usuarios

    ${body}=    Create Dictionary
    ...         email=${email}
    ...         password=${SENHA_PADRAO}

    Set Test Variable    ${body}