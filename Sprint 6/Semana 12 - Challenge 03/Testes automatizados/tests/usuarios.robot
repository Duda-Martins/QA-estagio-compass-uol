*** Settings ***
Documentation    Testes para o endpoint /usuarios.
Resource    ../common/common.robot

Suite Setup     Criar Sessão

*** Test Cases ***

CT001 - Criar usuário com dados válidos
    [Tags]    Alta    CT001
    Preparar massa de dados CT001
    Enviar requisição POST para /usuarios
    Validar que o código response    201
    Validar que a resposta contém mensagem    Cadastro realizado com sucesso
    Validar que a resposta contém   _id

CT004 - Criar usuário com senha fora do padrão
    [Tags]    Alta    CT004
    Preparar massa de dados CT004
    Enviar requisição POST para /usuarios
    Validar que o código response    400
    Validar que a resposta contém mensagem    Password fora do padrão aceito

CT005 - Criar usuário com e-mail de provedor proibido
    [Tags]    Alta    CT005
    Preparar massa de dados CT005
    Enviar requisição POST para /usuarios
    Validar que o código response    400
    Validar que a resposta contém mensagem    E-mail de provedor proibido

CT006 - Criar novo usuário com PUT (ID inexistente)
    [Tags]    Alta    CT006
    Preparar massa de dados CT006
    Enviar requisição PUT para /usuarios/_id
    Validar que o código response    201
    Validar que a resposta contém mensagem    Cadastro realizado com sucesso
    Validar que a resposta contém   _id

CT034 - Criar usuário comum com dados válidos
    [Tags]    Baixa    CT034
    Preparar massa de dados CT034
    Enviar requisição POST para /usuarios
    Validar que o código response    201
    Validar que a resposta contém mensagem    Cadastro realizado com sucesso
    Validar que a resposta contém   _id