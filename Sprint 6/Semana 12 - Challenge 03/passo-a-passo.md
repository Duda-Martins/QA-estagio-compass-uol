# Ativar as duas instâncias

# Copiar IPV4 da ServeRest, trocar no código do arquivo common_variables.resource, salvar, dar o commit e o git push.

# Terminal ServeRest (esquerda).

ls

(Colar conexão AWS)

cd serverestApi

npx serverest@latest

# Terminal Testes (direita).

ls

(Colar conexão AWS)

cd QA-estagio-compass-uol/"Sprint 6"/"Semana 12 - Challenge 03"
/"Testes automatizados"/

git pull

Robot -d ./results tests/