*** Settings ***
Documentation    Variáveis comuns.

*** Variables ***
# API Base URL
${IPV4}        13.220.179.107
${BASE_URL}    http://${IPV4}:3000

${SENHA_PADRAO}    12345
${STATUS_REQ}    any
${ID_INEXISTENTE}    p379fioh3id74o83

${PRECO_MIN}       5
${PRECO_MAX}       500
${QTD_MIN}         1
${QTD_MAX}         10