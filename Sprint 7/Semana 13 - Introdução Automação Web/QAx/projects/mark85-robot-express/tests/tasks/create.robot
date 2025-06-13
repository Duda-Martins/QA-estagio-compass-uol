*** Settings ***
Documentation    Cenários de cadastro de tarefas

Resource    ../../resources/base.resource

Test Setup    Start Session
Test Teardown    Take Screenshot
Library    Collections

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    ${data}    Get fixture    tasks    create

    Reset user from database    ${data}[user]

    Do login    ${data}[user]

    Go to task form
    Submit task form    ${data}[task]
    Task shoud be registered    ${data}[task][name]

Não deve cadastrar tarefa com nome duplicado
    [Tags]    dup
    ${data}    Get fixture    tasks    duplicate

    # Dado que eu tenho um novo usuário
    Reset user from database    ${data}[user]

    # E que esse usuário já cadastrou uma tarefa
    Create a new task from API    ${data}

    # E que estou logado na aplicação web
    Do login    ${data}[user]

    # Quando tento cadastrar essa tarefa que já foi cadastrada
    Go to task form
    Submit task form    ${data}[task]

    # Então devo ver uma notificação de duplicidade
    Notice shoud be    Oops! Tarefa duplicada.

Não deve cadastrar uma nova tarefa quando atinge o limite de tags
    [Tags]    tags_limit
    ${data}    Get fixture    tasks    tags_limit

    Reset user from database    ${data}[user]

    Do login    ${data}[user]

    Go to task form
    Submit task form    ${data}[task]

    Notice shoud be    Oops! Limite de tags atingido.