*** Settings ***
Documentation    Ações e elementos da página de listagem de tareafas

Library    Browser

*** Keywords ***
Task shoud be registered
    [Arguments]    ${task_name}

    Wait For Elements State    css=.task-todo >> text=${task_name}
    ...    visible
    ...    5

Task shoud be complete
    [Arguments]    ${task_name}

    ${element}    Set variable    css=.task-done >> text=${task_name}

    Wait For Elements State    ${element}
    ...    visible
    ...    5

    Get Style    ${element}    text-decoration-line    line-through

Mark task as completed
    [Arguments]    ${task_name}

    ${element}    Set Variable
    ...    xpath=//strong[text()="${task_name}"]/..//button[@class="item-toggle"]

    Wait For Elements State    ${element}
    ...    visible    5

    Click    ${element}

Request removal
    [Arguments]    ${task_name}

    ${element}    Set Variable
    ...    xpath=//strong[text()="${task_name}"]/..//button[@class="task-remove"]

    Wait For Elements State    ${element}
    ...    visible    5

    Click    ${element}

Task shoud not exist
    [Arguments]    ${task_name}

    ${element}    Set variable    css=.task-done >> text=${task_name}
    ...    detached