*** Settings ***
Documentation    Variáveis para o endpoint /produtos.
Resource    ../../common/common.robot

*** Keywords ***

Preparar massa de dados CT018b
    ${nome}=            FakerLibrary.Name
    ${descricao}=       FakerLibrary.Paragraph
    ${preco}=           FakerLibrary.Random Int    ${PRECO_MIN}    ${PRECO_MAX}
    ${quantidade}=      FakerLibrary.Random Int    ${QTD_MIN}    ${QTD_MAX}

    ${body}=    Create Dictionary
    ...         nome=${nome}
    ...         preco=${preco}
    ...         descricao=${descricao}
    ...         quantidade=${quantidade}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    Set Test Variable    ${body}
    Set Test Variable    ${headers}

Preparar massa de dados CT020a
    ${nome}=            FakerLibrary.Name
    ${descricao}=       FakerLibrary.Paragraph
    ${preco}=           FakerLibrary.Random Int    ${PRECO_MIN}    ${PRECO_MAX}
    ${quantidade}=      FakerLibrary.Random Int    ${QTD_MIN}    ${QTD_MAX}

    ${body}=    Create Dictionary
    ...         nome=${nome}
    ...         preco=${preco}
    ...         descricao=${descricao}
    ...         quantidade=${quantidade}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    Set Test Variable    ${body}
    Set Test Variable    ${headers}

Preparar massa de dados CT036
    ${nome}=            FakerLibrary.Name
    ${descricao}=       FakerLibrary.Paragraph
    ${preco}=           FakerLibrary.Random Number    3
    ${quantidade}=      FakerLibrary.Random Int    ${QTD_MIN}    ${QTD_MAX}

    ${body}=    Create Dictionary
    ...         nome=${nome}
    ...         preco=${preco}
    ...         descricao=${descricao}
    ...         quantidade=${quantidade}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    Set Test Variable    ${body}
    Set Test Variable    ${headers}

Preparar massa de dados CT037
    ${nome}=            FakerLibrary.Name
    ${descricao}=       FakerLibrary.Paragraph
    ${preco}=           FakerLibrary.Random Int    ${PRECO_MIN}    ${PRECO_MAX}
    ${quantidade}=      FakerLibrary.Random Int    ${QTD_MIN}    ${QTD_MAX}

    ${body}=    Create Dictionary
    ...         nome=${nome}
    ...         preco=${preco}
    ...         descricao=${descricao}
    ...         quantidade=${quantidade}

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    Set Test Variable    ${body}
    Set Test Variable    ${headers}