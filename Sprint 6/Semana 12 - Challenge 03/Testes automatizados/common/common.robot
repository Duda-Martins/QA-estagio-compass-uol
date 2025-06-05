*** Settings ***
Documentation    Librarys, resources e keywords comuns.

Library    RequestsLibrary
Library    Collections
Library    FakerLibrary

Resource    ../resource/usuarios.resource
Resource    ../resource/variaveis/variaveis_usuarios.resource
Resource    ../resource/login.resource
Resource    ../resource/variaveis/variaveis_login.resource
Resource    ../resource/produtos.resource
Resource    ../resource/variaveis/variaveis_produtos.resource
Resource    ../resource/carrinho.resource
Resource    ../resource/variaveis/variaveis_carrinho.resource

Resource    common_variables.resource

*** Keywords ***
Criar Sessão
    Create Session    alias=restful-serverest    url=${BASE_URL}

Validar que o código response
    [Arguments]    ${status_sucesso}
    Status Should Be    ${status_sucesso}

Validar que a resposta contém mensagem
    [Arguments]    ${mensagem}
    Dictionary Should Contain Item    ${RESPOSTA}    message    ${mensagem}

Validar que a resposta contém
    [Arguments]    ${key}
    Dictionary Should Contain Key    ${RESPOSTA}    ${key}