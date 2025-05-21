*** Settings ***
Documentation   Loop e estruturas de decisão

*** Variables ***
### Indíce da lista         0    1     2    3    4    5     6    7
@{LISTA_DE_NUMEROS}    5    8    10    4    5    10    3    1

*** Test Cases ***
Teste de FOR do tipo IN
    [Documentation]  Faz um loop percorrendo a lista
    Usando FOR IN

*** Keywords ***

Usando FOR IN
    Log To Console    ${\n}
    FOR  ${NUMERO}   IN  @{LISTA_DE_NUMEROS}
        IF    ${NUMERO} == 5
            ${MENSAGEM}    Numero 5 encontrado
        ELSE IF    ${NUMERO} == 10
            ${MENSAGEM}    Numero 10 encontrado
        ELSE
            ${MENSAGEM}    Nenhum numero encontrado
        END
        Log    ${\n}Quem são os números?${\n}
        Log    ${MENSAGEM}
    END

Numero 5 encontrado
    RETURN    Eu sou o número 5!

Numero 10 encontrado
    RETURN    Eu sou o número 10!

Nenhum numero encontrado
    RETURN    Eu não sou o número 5 e nem o 10!