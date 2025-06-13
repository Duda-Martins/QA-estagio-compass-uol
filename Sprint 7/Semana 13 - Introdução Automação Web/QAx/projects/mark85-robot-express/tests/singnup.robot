*** Settings ***
Documentation    Cenários de teste do cadastro de usuários

Resource    ../resources/base.resource

Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder cadastrar um novo usuário

    ${user}    Create Dictionary
    ...    name=Fernado Papito
    ...    email=papito@yahoo.com
    ...    password=pwd123

    Remove user from database    ${user}[email]

    Go to signup page
    Submit signup form    ${user}

    Notice shoud be    Boas vindas ao Mark85, o seu gerenciador de tarefas.

Não deve permitir o cadastro com e-mail duplicado
    [Tags]    dup

    ${user}    Create Dictionary
    ...    name=Papito Fernado
    ...    email=fernando@gmail.com
    ...    password=pwd123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}

    Go to signup page
    Submit signup form    ${user}

    Notice shoud be    Oops! Já existe uma conta com o e-mail informado.

Campos obrigatórios
    [Tags]    required

    ${user}    Create Dictionary
    ...    name=${EMPTY}
    ...    email=${EMPTY}
    ...    password=${EMPTY}

    Go to signup page
    Submit signup form    ${user}

    Alert shoud be    Informe seu nome completo
    Alert shoud be    Informe seu e-email
    Alert shoud be    Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com um e-mail incorreto
    [Tags]    inv_email

    ${user}    Create Dictionary
    ...    name=Charles Xavier
    ...    email=xavier.com.br
    ...    password=123456

    Go to signup page
    Submit signup form    ${user}

    Alert shoud be    Digite um e-mail válido

Não deve cadastrar com senha muito curta
    [Tags]    temp
    @{password_list}    Create List    1    12    123    1234    12345

    FOR    ${password}    IN    @{password_list}
        ${user}    Create Dictionary
        ...    name=Fernado Papito
        ...    email=papito@msn.com
        ...    password=${password}

        Go to signup page
        Submit signup form    ${user}

        Alert shoud be    Informe uma senha com pelo menos 6 digitos

    END