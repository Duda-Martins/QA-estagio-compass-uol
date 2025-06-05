*** Settings ***
Documentation    Variáveis para o endpoint /usuarios.
Resource    ../../common/common.robot

*** Keywords ***

Preparar massa de dados CT001
    ${nome}=    FakerLibrary.Name
    ${email}=   FakerLibrary.Company Email
    ${body}=    Create Dictionary
    ...         nome=${nome}
    ...         email=${email}
    ...         password=${SENHA_PADRAO}
    ...         administrador=true

    Set Test Variable    ${email}
    Set Test Variable    ${body}

Preparar massa de dados CT004
    ${nome}=    FakerLibrary.Name
    ${email}=   FakerLibrary.Company Email
    ${body}=    Create Dictionary
    ...         nome=${nome}
    ...         email=${email}
    ...         password=123
    ...         administrador=true

    Set Test Variable    ${body}

Preparar massa de dados CT005
    ${nome}=    FakerLibrary.Name
    ${email}=   FakerLibrary.Free Email
    ${body}=    Create Dictionary
    ...         nome=${nome}
    ...         email=${email}
    ...         password=${SENHA_PADRAO}
    ...         administrador=true

    Set Test Variable    ${body}

Preparar massa de dados CT006
    ${nome}=    FakerLibrary.Name
    ${email}=   FakerLibrary.Company Email
    ${body}=    Create Dictionary
    ...         nome=${nome}
    ...         email=${email}
    ...         password=${SENHA_PADRAO}
    ...         administrador=true

    Set Test Variable    ${body}

Preparar massa de dados CT034
    ${nome}=    FakerLibrary.Name
    ${email}=   FakerLibrary.Company Email
    ${body}=    Create Dictionary
    ...         nome=${nome}
    ...         email=${email}
    ...         password=${SENHA_PADRAO}
    ...         administrador=false

    Set Test Variable    ${email}
    Set Test Variable    ${body}