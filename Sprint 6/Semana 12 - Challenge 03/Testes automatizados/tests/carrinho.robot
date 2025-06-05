*** Settings ***
Documentation    Testes para o endpoint /carrinho.
Resource    ../common/common.robot

Suite Setup     Criar Sessão

*** Test Cases ***

CT024 - Criar um único carrinho por usuário autenticado
    [Tags]    Alta    CT024
    Autenticar usuário autorizado e obter token
    Preparar massa de dados CT024
    Enviar requisição POST para /carrinhos
    Validar que o código response    201
    Validar que a resposta contém mensagem    Cadastro realizado com sucesso
    Validar que a resposta contém   _id

CT030 - Concluir compra exclui o carrinho
    [Tags]    Alta    CT030
    Criar um carrinho
    Enviar requisição DELETE para /carrinhos/concluir-compra
    Validar que o código response    200
    Validar que a resposta contém mensagem    Registro excluído com sucesso

CT031 - Cancelar compra exclui o carrinho e reabastece o estoque
    [Tags]    Alta    CT031
    Criar um carrinho
    Enviar requisição DELETE para /carrinhos/cancelar-compra
    Validar que o código response    200
    Validar que a resposta contém mensagem    Registro excluído com sucesso