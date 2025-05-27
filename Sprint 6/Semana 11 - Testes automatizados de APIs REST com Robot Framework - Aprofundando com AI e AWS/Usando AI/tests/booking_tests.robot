*** Settings ***
Resource  ../resources/aunth_tests.resource
Resource    ../resources/booking_tests.resource

*** Test Cases ***
Cenário 01 Criação de reserva com sucesso
    Realizar reserva    200
    Verificar se tem o status code correto    200
    Verificar conteúdo da resposta CN1    ${RESPOSTA}    ${body}    ${bookingdates}

Cenário 02 Atulização de reserva com sucesso
    Realizar reserva    200
    Realizar a edição    200
    Verificar se tem o status code correto    200
    Verificar conteúdo da resposta CN2    ${RESPOSTA}    ${body}    ${bookingdates}

Cenário 03 Deleção de reserva com sucesso
    Realizar reserva    200
    Realizar a Deleção    201
    Verificar se tem o status code correto    201

Cenário 04 Adiquirindo ids de todas as reservas com sucesso
    Realizar o GET por IDs    200
    Verificar se tem o status code correto    200

Cenário 05 Adiquirindo ids de reservas por nome com sucesso
    Realizar o GET por nome    200
    Verificar se tem o status code correto    200

Cenário 06 Adiquirindo ids de reservas por datas com sucesso
    Realizar o GET por datas    200
    Verificar se tem o status code correto    200

Cenário 07 Adiquirindo reservas por ids com sucesso
    Realizar reserva    200
    Realizar o GET de reserva    200
    Verificar se tem o status code correto    200

Cenário 08 Atulização parcial de reserva com sucesso
    Realizar reserva    200
    Realizar atualização parcial    200
    Verificar conteúdo da resposta CN8    ${RESPOSTA}    ${editado_body}    ${body}    ${bookingdates}
