*** Settings ***
Documentation    Dias dos meses do ano
*** Variable ***

#Dicionário dos meses do ano e seus dias:
&{MESES}    janeiro=31    fevereiro=28    março=31    abril=30    maio=31    junho=30    julho=31    agosto=31    setembro=30    outubro=31    novembro=30    dezembro=31

*** Test Cases ***
Mostrando os meses do ano
    Realizando o log dos meses do ano e seus dias

*** Keywords ***
Realizando o log dos meses do ano e seus dias

    # Lendo a Lista ${nome[indice]}
    Log To Console    ${\n}Estes são os meses do ano e seus dias:${\n}${\n}Janeiro: ${MESES.janeiro}${\n}Fevereiro: ${MESES.fevereiro}${\n}Março: ${MESES.março}${\n}Abril: ${MESES.abril}${\n}Maio: ${MESES.maio}${\n}Junho: ${MESES.junho}${\n}Julho: ${MESES.julho}${\n}Agosto: ${MESES.agosto}${\n}Setembro: ${MESES.setembro}${\n}Outubro: ${MESES.outubro}${\n}Novembro: ${MESES.novembro}${\n}Dezembro: ${MESES.dezembro}
