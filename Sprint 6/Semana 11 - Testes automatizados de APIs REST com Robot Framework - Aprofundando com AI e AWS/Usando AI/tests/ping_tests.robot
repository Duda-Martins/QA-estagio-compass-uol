*** Settings ***
Documentation    Test suite for API health check functionality.
...              Tests the ping endpoint to verify that:
...              - The API is up and running
...              - Returns correct status code
Resource  ../resources/ping_tests.resource
Resource  ../resources/aunth_tests.resource

*** Test Cases ***
Cenário 01 Ping com sucesso
    [Documentation]    Tests successful health check of the API
    ...               Verifies that the ping endpoint returns 201 status code
    Fazer o Ping    201
    Verificar se tem o status code correto    201