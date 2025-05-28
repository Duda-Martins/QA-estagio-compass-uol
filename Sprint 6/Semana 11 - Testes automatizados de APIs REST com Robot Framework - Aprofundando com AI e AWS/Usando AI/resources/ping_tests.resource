*** Settings ***
Documentation    Resource file containing keywords for health check operations.
...              Provides functionality for checking the API's health status
...              through the ping endpoint.
Library  RequestsLibrary
Library  Collections
Resource  ../resources/aunth_tests.resource
Resource  common/common_keywords.resource

*** Keywords ***
Fazer o Ping
    [Documentation]    Performs a health check on the API by calling the ping endpoint
    ...               Args:
    ...               - status_code_desejado: Expected HTTP status code
    [Arguments]    ${status_code_desejado}
    Criar Sessão

    GET On Session
    ...          alias=restful-booker
    ...          url=/ping
    ...          expected_status=${status_code_desejado}