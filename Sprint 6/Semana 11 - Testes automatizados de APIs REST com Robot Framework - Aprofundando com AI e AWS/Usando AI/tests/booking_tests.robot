*** Settings ***
Documentation    Test suite for booking management functionality.
...              Tests all CRUD operations and filtering capabilities:
...              - Creating new bookings
...              - Reading booking details
...              - Updating existing bookings
...              - Deleting bookings
...              - Filtering bookings by various criteria
Resource  ../resources/aunth_tests.resource
Resource    ../resources/booking_tests.resource

Suite Setup     Criar Sessão

*** Test Cases ***
Cenário 01 Criação de reserva com sucesso
    [Documentation]    Tests successful creation of a new booking
    Realizar reserva    200
    Verificar se tem o status code correto    200
    Verificar conteúdo da resposta CN1    ${RESPOSTA}    ${body}    ${bookingdates}

Cenário 02 Atulização de reserva com sucesso
    [Documentation]    Tests successful update of an existing booking
    Realizar reserva    200
    Realizar a edição    200
    Verificar se tem o status code correto    200
    Verificar conteúdo da resposta CN2    ${RESPOSTA}    ${body}    ${bookingdates}

Cenário 03 Deleção de reserva com sucesso
    [Documentation]    Tests successful deletion of a booking
    Realizar reserva    200
    Realizar a Deleção    201
    Verificar se tem o status code correto    201

Cenário 04 Adiquirindo ids de todas as reservas com sucesso
    [Documentation]    Tests retrieval of all booking IDs
    Realizar o GET por IDs    200
    Verificar se tem o status code correto    200

Cenário 05 Adiquirindo ids de reservas por nome com sucesso
    [Documentation]    Tests filtering bookings by guest name
    Realizar o GET por nome    200
    Verificar se tem o status code correto    200

Cenário 06 Adiquirindo ids de reservas por datas com sucesso
    [Documentation]    Tests filtering bookings by date range
    Realizar o GET por datas    200
    Verificar se tem o status code correto    200

Cenário 07 Adiquirindo reservas por ids com sucesso
    [Documentation]    Tests retrieval of a specific booking by ID
    Realizar reserva    200
    Realizar o GET de reserva    200
    Verificar se tem o status code correto    200

Cenário 08 Atulização parcial de reserva com sucesso
    [Documentation]    Tests partial update of a booking
    Realizar reserva    200
    Realizar atualização parcial    200
    Verificar conteúdo da resposta CN8    ${RESPOSTA}    ${editado_body}    ${body}    ${bookingdates}