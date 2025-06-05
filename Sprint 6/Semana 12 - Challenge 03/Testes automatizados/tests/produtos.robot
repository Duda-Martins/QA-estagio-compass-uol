*** Settings ***
Documentation    Testes para o endpoint /produtos.
Resource    ../common/common.robot

Suite Setup     Criar Sessão

*** Test Cases ***

CT015 - Impedir acesso à rota de produtos sem autenticação
    [Tags]    Alta    CT015
    Enviar requisição para GET /produtos
    Validar que o código response    400
    Validar que a resposta contém mensagem    Token de acesso ausente, inválido ou expirado

CT018b - PUT cria novo produto com ID inexistente e nome único
    [Tags]    Alta    CT018b
    Autenticar usuário autorizado e obter token
    Preparar massa de dados CT018b
    Enviar requisição PUT para /produtos/_id
    Validar que o código response    201
    Validar que a resposta contém mensagem    Cadastro realizado com sucesso
    Validar que a resposta contém   _id

CT020a - Impedir usuário comum de cadastrar produto
    [Tags]    Alta    CT020a
    Autenticar usuário comum e obter token
    Preparar massa de dados CT020a
    Enviar requisição POST para /produtos
    Validar que o código response    403
    Validar que a resposta contém mensagem    Rota exclusiva para administradores

CT036 - POST de novo produto com valor quebrado com sucesso
    [Tags]    Alta    CT036
    Autenticar usuário autorizado e obter token
    Preparar massa de dados CT036
    Enviar requisição POST para /produtos
    Validar que o código response    201
    Validar que a resposta contém mensagem    Cadastro realizado com sucesso
    Validar que a resposta contém   _id

CT037 - POST de novo produto com valor inteiro com sucesso
    [Tags]    Alta    CT037
    Autenticar usuário autorizado e obter token
    Preparar massa de dados CT037
    Enviar requisição POST para /produtos
    Validar que o código response    201
    Validar que a resposta contém mensagem    Cadastro realizado com sucesso
    Validar que a resposta contém   _id