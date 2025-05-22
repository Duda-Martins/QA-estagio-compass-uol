*** Settings ***
Library  RequestsLibrary
Library  Collections
Resource  ../resources/aunth_tests.resource

*** Keywords ***
Realizar reserva
    [Arguments]    ${status_code_desejado}

    Set Test Variable    @{bookingdates}    Create Dictionary
    ...    checkin=2025-12-14
    ...    checkout=2026-01-14

    Set Test Variable    @{body}    Create Dictionary
    ...    firstname=Testum
    ...    lastname=Bookingum
    ...    totalprice=201
    ...    depositpaid=${True}
    ...    bookingdates=${bookingdates}
    ...    additionalneeds='Milk allergy'

    ${header}    Create Dictionary
    ...    Content-Type=application/json

    Criar Sessão

    ${resposta}  POST On Session
    ...          alias=restful-booker
    ...          url=/booking
    ...          json=${body}
    ...          expected_status=${status_code_desejado}
    ...          headers=${header}

    Set Suite Variable    ${id}    ${resposta}[bookingid]
    Log To Console    ${id}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Verificar conteúdo da resposta CN1
    [Arguments]    ${RESPOSTA}    ${body}    ${bookingdates}

    Dictionary Should Contain Key    ${RESPOSTA}    bookingid
    Dictionary Should Contain Key    ${RESPOSTA}    booking
    Dictionary Should Contain Item    ${RESPOSTA.booking}    firstname    ${body.firstname}
    Dictionary Should Contain Item    ${RESPOSTA.booking}    lastname    ${body.lastname}
    Dictionary Should Contain Item    ${RESPOSTA.booking}    totalprice    ${body.totalprice}
    Dictionary Should Contain Item    ${RESPOSTA.booking}    depositpaid    ${body.depositpaid}
    Dictionary Should Contain Key    ${RESPOSTA.booking}    bookingdates
    Dictionary Should Contain Item    ${RESPOSTA.booking.bookingdates}    checkin    ${bookingdates.checkin}
    Dictionary Should Contain Item    ${RESPOSTA.booking.bookingdates}    checkout    ${bookingdates.checkout}
    Dictionary Should Contain Item    ${RESPOSTA.booking}    additionalneeds    ${body.additionalneeds}

Realizar a edição
    [Arguments]    ${status_code_desejado}

    Setar usuário e senha
    Realizar a autenticação    ${username}    ${senha_aleatoria}    ${status_code_desejado}
    Guardar o token

    Set Test Variable    @{bookingdates}    Create Dictionary
    ...    checkin=2025-12-26
    ...    checkout=2026-01-26

    Set Test Variable    @{body}    Create Dictionary
    ...    firstname=Testdois
    ...    lastname=Bookingdois
    ...    totalprice=202
    ...    depositpaid=${False}
    ...    bookingdates=${bookingdates}
    ...    additionalneeds='Milk allergy'

    ${header}    Create Dictionary
    ...    Content-Type=application/json
    ...    Accept=application/json
    ...    Cookie=token=${TOKEN}

    Criar Sessão

    ${resposta}  PUT On Session
    ...          alias=restful-booker
    ...          url=/booking:${id}
    ...          json=${body}
    ...          expected_status=${status_code_desejado}
    ...          headers=${header}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Verificar conteúdo da resposta CN2

    [Arguments]    ${RESPOSTA}    ${body}    ${bookingdates}

    Dictionary Should Contain Item    ${RESPOSTA}    firstname    ${body.firstname}
    Dictionary Should Contain Item    ${RESPOSTA}    lastname    ${body.lastname}
    Dictionary Should Contain Item    ${RESPOSTA}    totalprice    ${body.totalprice}
    Dictionary Should Contain Item    ${RESPOSTA}    depositpaid    ${body.depositpaid}
    Dictionary Should Contain Key    ${RESPOSTA}    bookingdates
    Dictionary Should Contain Item    ${RESPOSTA.bookingdates}    checkin    ${bookingdates.checkin}
    Dictionary Should Contain Item    ${RESPOSTA.bookingdates}    checkout    ${bookingdates.checkout}
    Dictionary Should Contain Item    ${RESPOSTA}    additionalneeds    ${body.additionalneeds}

Realizar a Deleção
    [Arguments]    ${status_code_desejado}    ${id}

    Setar usuário e senha
    Realizar a autenticação    ${username}    ${senha_aleatoria}    ${status_code_desejado}
    Guardar o token

    ${header}    Create Dictionary
    ...    Content-Type=application/json
    ...    Cookie=token=${TOKEN}

    Criar Sessão

    ${resposta}  DELETE On Session
    ...          alias=restful-booker
    ...          url=/booking:${id}
    ...          expected_status=${status_code_desejado}
    ...          headers=${header}

Realizar o GET por IDs
    [Arguments]    ${status_code_desejado}

    Criar Sessão

    ${resposta}  GET On Session
    ...          alias=restful-booker
    ...          url=/booking
    ...          expected_status=${status_code_desejado}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Realizar o GET por nome
    [Arguments]    ${status_code_desejado}

    Criar Sessão

    ${resposta}  GET On Session
    ...          alias=restful-booker
    ...          url=/booking
    ...          expected_status=/booking?firstname=sally&lastname=brown

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}
Realizar o GET por datas
    [Arguments]    ${status_code_desejado}

    Criar Sessão

    ${resposta}  GET On Session
    ...          alias=restful-booker
    ...          url=/booking
    ...          expected_status=/booking?checkin=2014-03-13&checkout=2014-05-21

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Realizar o GET de reserva
    [Arguments]    ${status_code_desejado}    ${id}

    Setar usuário e senha
    Realizar a autenticação    ${username}    ${senha_aleatoria}    ${status_code_desejado}
    Guardar o token

    Criar Sessão

    ${resposta}  GET On Session
    ...          alias=restful-booker
    ...          url=/booking:${id}
    ...          expected_status=${status_code_desejado}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Realizar atualização parcial
    [Arguments]    ${status_code_desejado}

    Setar usuário e senha
    Realizar a autenticação    ${username}    ${senha_aleatoria}    ${status_code_desejado}
    Guardar o token

    ${header}    Create Dictionary
    ...    Content-Type=application/json
    ...    Accept=application/json
    ...    Cookie=token=${TOKEN}

    Set Test Variable    @{edicao_body}    Create Dictionary
    ...    firstname=Testoito
    ...    totalprice=208

    Criar Sessão

    ${resposta}  PUT On Session
    ...          alias=restful-booker
    ...          url=/booking:${id}
    ...          json=${edicao_body}
    ...          expected_status=${status_code_desejado}
    ...          headers=${header}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}
    Log    ${RESPOSTA}
    Log to Console    ${RESPOSTA}

Verificar conteúdo da resposta CN8
    [Arguments]    ${RESPOSTA}    ${edicao_body}    ${body}    ${bookingdates}

    Dictionary Should Contain Item    ${RESPOSTA}    firstname    ${edicao_body.firstname}
    Dictionary Should Contain Item    ${RESPOSTA}    lastname    ${body.lastname}
    Dictionary Should Contain Item    ${RESPOSTA}    totalprice    ${edicao_body.totalprice}
    Dictionary Should Contain Item    ${RESPOSTA}    depositpaid    ${body.depositpaid}
    Dictionary Should Contain Key    ${RESPOSTA}    bookingdates
    Dictionary Should Contain Item    ${RESPOSTA.bookingdates}    checkin    ${bookingdates.checkin}
    Dictionary Should Contain Item    ${RESPOSTA.bookingdates}    checkout    ${bookingdates.checkout}
    Dictionary Should Contain Item    ${RESPOSTA}    additionalneeds    ${body.additionalneeds}

