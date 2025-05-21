*** Settings ***
Documentation   Exemplo de uso de variáveis como argumentos em Keywords
Library         String

*** Variables ***
&{PESSOA}       nome=Maria   sobrenome=Silva

*** Test Cases ***
Criar um e-mail
    Gerar o email

*** Keywords ***
Gerar o email
    ${STRING_ALEATORIA}    Generate Random String
    ${EMAIL}    Juntando nomes    ${PESSOA.nome}  ${PESSOA.sobrenome}  ${STRING_ALEATORIA}  @testerobot.com
    Log To Console    ${\n}O email gerado é: ${EMAIL}.

Juntando nomes
    [Arguments]    ${NOME}  ${SOBRENOME}  ${STRING}  ${DOMINIO}
    ${EMAIL_GERADO}    Catenate    SEPARATOR=    ${NOME}    ${SOBRENOME}    ${STRING}    ${DOMINIO}
    RETURN        ${EMAIL_GERADO}