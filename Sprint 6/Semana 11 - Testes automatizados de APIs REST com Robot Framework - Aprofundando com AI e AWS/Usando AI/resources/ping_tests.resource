*** Settings ***
Library  RequestsLibrary
Library  Collections
Resource  ../resources/aunth_tests.resource

*** Keywords ***
Fazer o Ping
    [Arguments]    ${status_code_desejado}
    Criar Sessão

    GET On Session
    ...          alias=restful-booker
    ...          url=/ping
    ...          expected_status=${status_code_desejado}
