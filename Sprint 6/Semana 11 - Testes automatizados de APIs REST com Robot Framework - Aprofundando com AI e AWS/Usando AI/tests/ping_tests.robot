*** Settings ***
Resource  ../resources/ping_tests.resource
Resource  ../resources/aunth_tests.resource
Documentation    Testes para o end-point Ping

*** Test Cases ***
Cenário 01 Ping com sucesso
    Fazer o Ping    201
    Verificar se tem o status code correto    201