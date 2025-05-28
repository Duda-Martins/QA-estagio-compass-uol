*** Settings ***
Documentation    Resource file containing keywords for booking-related operations.
...              Provides functionality for creating, updating, deleting and retrieving
...              bookings through the Restful-Booker API.
Library  RequestsLibrary
Library  Collections
Resource  ../resources/aunth_tests.resource
Resource  common_variables.resource

*** Keywords ***
Realizar reserva
    [Documentation]    Creates a new booking with predefined test data
    ...               Args:
    ...               - status_code_desejado: Expected HTTP status code
    [Arguments]    ${status_code_desejado}

    &{bookingdates}    Create Dictionary
    ...    checkin=${DEFAULT_CHECKIN}
    ...    checkout=${DEFAULT_CHECKOUT}

    Set Test Variable    &{bookingdates}

    &{body}    Create Dictionary
    ...    firstname=${DEFAULT_FIRSTNAME}
    ...    lastname=${DEFAULT_LASTNAME}
    ...    totalprice=${DEFAULT_TOTALPRICE}
    ...    depositpaid=${DEFAULT_DEPOSITPAID}
    ...    bookingdates=${bookingdates}
    ...    additionalneeds=${DEFAULT_ADDITIONALNEEDS}

    Set Test Variable    &{body}

    ${header}    Create Dictionary
    ...    Content-Type=${CONTENT_TYPE_JSON}

    Criar Sessão

    ${resposta}  POST On Session
    ...          alias=restful-booker
    ...          url=/booking
    ...          json=${body}
    ...          expected_status=${status_code_desejado}
    ...          headers=${header}

    Set Test Variable    ${id}    ${resposta.json()}[bookingid]
    Log To Console    ${id}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Verificar conteúdo da resposta CN1
    [Documentation]    Verifies the content of a booking creation response
    [Arguments]    ${RESPOSTA}    ${body}    ${bookingdates}

    Dictionary Should Contain Key    ${RESPOSTA}    bookingid
    Dictionary Should Contain Key    ${RESPOSTA}    booking
    Dictionary Should Contain Item    ${RESPOSTA}[booking]    firstname    ${body.firstname}
    Dictionary Should Contain Item    ${RESPOSTA}[booking]    lastname    ${body.lastname}
    Dictionary Should Contain Key    ${RESPOSTA}[booking]    totalprice
    Dictionary Should Contain Item    ${RESPOSTA}[booking]    depositpaid    ${body.depositpaid}
    Dictionary Should Contain Key    ${RESPOSTA}[booking]    bookingdates
    Dictionary Should Contain Item    ${RESPOSTA}[booking][bookingdates]    checkin    ${bookingdates.checkin}
    Dictionary Should Contain Item    ${RESPOSTA}[booking][bookingdates]    checkout    ${bookingdates.checkout}
    Dictionary Should Contain Item    ${RESPOSTA}[booking]    additionalneeds    ${body.additionalneeds}

Realizar a edição
    [Documentation]    Updates an existing booking with new test data
    [Arguments]    ${status_code_desejado}

    Setar usuário e senha
    Realizar a autenticação    ${username}    ${senha_aleatoria}    ${status_code_desejado}
    Guardar o token

    &{bookingdates}    Create Dictionary
    ...    checkin=${UPDATED_CHECKIN}
    ...    checkout=${UPDATED_CHECKOUT}

    Set Test Variable    &{bookingdates}

    &{body}    Create Dictionary
    ...    firstname=${UPDATED_FIRSTNAME}
    ...    lastname=${UPDATED_LASTNAME}
    ...    totalprice=${UPDATED_TOTALPRICE}
    ...    depositpaid=${UPDATED_DEPOSITPAID}
    ...    bookingdates=${bookingdates}
    ...    additionalneeds=${DEFAULT_ADDITIONALNEEDS}

    Set Test Variable    &{body}

    &{header}    Create Dictionary
    ...    Content-Type=${CONTENT_TYPE_JSON}
    ...    Accept=${CONTENT_TYPE_JSON}
    ...    Cookie=token=${TOKEN}

    Criar Sessão

    ${resposta}  PUT On Session
    ...          alias=restful-booker
    ...          url=/booking/${id}
    ...          json=${body}
    ...          expected_status=${status_code_desejado}
    ...          headers=${header}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Verificar conteúdo da resposta CN2
    [Documentation]    Verifies the content of a booking update response
    [Arguments]    ${RESPOSTA}    ${body}    ${bookingdates}

    Dictionary Should Contain Item    ${RESPOSTA}    firstname    ${body.firstname}
    Dictionary Should Contain Item    ${RESPOSTA}    lastname    ${body.lastname}
    Dictionary Should Contain Key    ${RESPOSTA}    totalprice
    Dictionary Should Contain Item    ${RESPOSTA}    depositpaid    ${body.depositpaid}
    Dictionary Should Contain Key    ${RESPOSTA}    bookingdates
    Dictionary Should Contain Item    ${RESPOSTA}[bookingdates]    checkin    ${bookingdates.checkin}
    Dictionary Should Contain Item    ${RESPOSTA}[bookingdates]    checkout    ${bookingdates.checkout}
    Dictionary Should Contain Item    ${RESPOSTA}    additionalneeds    ${body.additionalneeds}

Realizar a Deleção
    [Documentation]    Deletes an existing booking
    [Arguments]    ${status_code_desejado}
    Realizar reserva    200

    Setar usuário e senha
    Realizar a autenticação    ${username}    ${senha_aleatoria}    200

    ${header}    Create Dictionary
    ...    Content-Type=${CONTENT_TYPE_JSON}
    ...    Cookie=token=${TOKEN}

    Criar Sessão

    ${resposta}  DELETE On Session
    ...          alias=restful-booker
    ...          url=/booking/${id}
    ...          expected_status=${status_code_desejado}
    ...          headers=${header}

Realizar o GET por IDs
    [Documentation]    Retrieves all booking IDs
    [Arguments]    ${status_code_desejado}

    Criar Sessão

    ${resposta}  GET On Session
    ...          alias=restful-booker
    ...          url=/booking
    ...          expected_status=${status_code_desejado}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Realizar o GET por nome
    [Documentation]    Retrieves bookings filtered by first and last name
    [Arguments]    ${status_code_desejado}

    Criar Sessão

    ${resposta}  GET On Session
    ...          alias=restful-booker
    ...          url=/booking?firstname=sally&lastname=brown
    ...          expected_status=${status_code_desejado}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Realizar o GET por datas
    [Documentation]    Retrieves bookings filtered by check-in and check-out dates
    [Arguments]    ${status_code_desejado}

    Criar Sessão

    ${resposta}  GET On Session
    ...          alias=restful-booker
    ...          url=/booking?checkin=2014-03-13&checkout=2014-05-21
    ...          expected_status=${status_code_desejado}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Realizar o GET de reserva
    [Documentation]    Retrieves a specific booking by ID
    [Arguments]    ${status_code_desejado}

    Setar usuário e senha
    Realizar a autenticação    ${username}    ${senha_aleatoria}    ${status_code_desejado}
    Guardar o token

    Criar Sessão

    ${resposta}  GET On Session
    ...          alias=restful-booker
    ...          url=/booking/${id}
    ...          expected_status=${status_code_desejado}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Realizar atualização parcial
    [Documentation]    Performs a partial update of a booking
    [Arguments]    ${status_code_desejado}

    Setar usuário e senha
    Realizar a autenticação    ${username}    ${senha_aleatoria}    ${status_code_desejado}
    Guardar o token

    ${header}    Create Dictionary
    ...    Content-Type=${CONTENT_TYPE_JSON}
    ...    Accept=${CONTENT_TYPE_JSON}
    ...    Cookie=token=${TOKEN}

    ${editado_body}    Create Dictionary
    ...    firstname=${PARTIAL_UPDATE_FIRSTNAME}
    ...    depositpaid=${PARTIAL_UPDATE_DEPOSITPAID}

    Set Test Variable    ${editado_body}

    Criar Sessão

    ${resposta}  PATCH On Session
    ...          alias=restful-booker
    ...          url=/booking/${id}
    ...          json=${editado_body}
    ...          expected_status=${status_code_desejado}
    ...          headers=${header}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Verificar conteúdo da resposta CN8
    [Documentation]    Verifies the content of a partial update response
    [Arguments]    ${RESPOSTA}    ${editado_body}    ${body}    ${bookingdates}

    Log    ${bookingdates}
    Dictionary Should Contain Item    ${RESPOSTA}    firstname    ${editado_body.firstname}
    Dictionary Should Contain Item    ${RESPOSTA}    lastname    ${body.lastname}
    Dictionary Should Contain Key    ${RESPOSTA}    totalprice
    Dictionary Should Contain Item    ${RESPOSTA}    depositpaid    ${editado_body.depositpaid}
    Dictionary Should Contain Key    ${RESPOSTA}    bookingdates
    Dictionary Should Contain Item    ${RESPOSTA}[bookingdates]    checkin    ${bookingdates.checkin}
    Dictionary Should Contain Item    ${RESPOSTA}[bookingdates]    checkout    ${bookingdates.checkout}
    Dictionary Should Contain Item    ${RESPOSTA}    additionalneeds    ${body.additionalneeds}