*** Settings ***
Documentation    Meses do ano

*** Variable ***

#Lista dos meses do ano:
@{MESES}    Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro

*** Test Cases ***
Mostrando os meses do ano
    Realizando o log dos meses do ano

*** Keywords ***
Realizando o log dos meses do ano

    # Lendo a Lista ${nome[indice]}
    Log To Console    ${\n}Estes são os meses do ano na ordem:${\n}${\n}1: ${MESES[0]}${\n}2: ${MESES[1]}${\n}3: ${MESES[2]}${\n}4: ${MESES[3]}${\n}5: ${MESES[4]}${\n}6: ${MESES[5]}${\n}7: ${MESES[6]}${\n}8: ${MESES[7]}${\n}9: ${MESES[8]}${\n}10: ${MESES[9]}${\n}11: ${MESES[10]}${\n}12: ${MESES[11]}