*** Settings ***
Resource  ../resources/aunth_tests.resource
Resource    ../resources/booking_tests.resource

*** Test Cases ***
Cenário 01 Criação de reserva com sucesso
    Realizar reserva    200
    Verificar se tem o status code correto    200
    Verificar conteúdo da resposta CN1    ${RESPOSTA}    ${body}    ${bookingdates}

Cenário 02 Atulização de reserva com sucesso
    Realizar a edição    200
    Verificar se tem o status code correto    200
    Verificar conteúdo da resposta CN2    ${RESPOSTA}    ${body}    ${bookingdates}
    
Cenário 03 Deleção de reserva com sucesso
    Realizar a Deleção    201
    Verificar se tem o status code correto    201
