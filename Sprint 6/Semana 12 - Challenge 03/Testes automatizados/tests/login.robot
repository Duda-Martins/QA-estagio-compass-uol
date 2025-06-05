*** Settings ***
Documentation    Testes para o endpoint /login.
Resource    ../common/common.robot

Suite Setup     Criar Sessão

*** Test Cases ***
CT011 - Impedir autenticação de usuário inexistentecom sucesso
    [Tags]    Alta    CT011
    Preparar massa de dados CT011
    Enviar requisição POST para /login
    Validar que o código response    401
    Validar que a resposta contém mensagem    Email e/ou senha inválidos

CT012 - Impedir autenticação com senha inválida
    [Tags]    Alta    CT012
    Preparar massa de dados CT012
    Enviar requisição POST para /login
    Validar que o código response    401
    Validar que a resposta contém mensagem    Email e/ou senha inválidos

CT013 - Autenticação bem-sucedida com usuário válido
    [Tags]    Alta    CT013
    Preparar massa de dados CT013
    Enviar requisição POST para /login
    Salvar Token
    Validar que o código response    200
    Validar que a resposta contém mensagem    Login realizado com sucesso
    Validar que a resposta contém   authorization

CT035 - Autenticação bem-sucedida com usuário comum válido
    [Tags]    Alta    CT035
    Preparar massa de dados CT035
    Enviar requisição POST para /login
    Salvar Token
    Validar que o código response    200
    Validar que a resposta contém mensagem    Login realizado com sucesso
    Validar que a resposta contém   authorization