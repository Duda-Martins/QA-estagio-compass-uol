*** Settings ***
Documentation    Common keywords used across multiple test suites.
...              Contains shared functionality for session management
...              and response validation.
Library    RequestsLibrary
Library    Collections
Resource    common_variables.resource

*** Keywords ***
Criar Sessão
    [Documentation]    Creates a session with the Restful-Booker API
    Create Session    alias=restful-booker    url=${BASE_URL}

Verificar se tem o status code correto
    [Documentation]    Verifies if the response has the expected status code
    [Arguments]    ${status_sucesso}
    Status Should Be    ${status_sucesso}