*** Settings ***

Library    libs/database.py
Library    Browser
Library    OperatingSystem
Library    JSONLibrary

Resource    env.resource

Resource    pages/components/Header.resource
Resource    pages/components/Notice.resource
Resource    pages/components/Alert.resource

Resource    pages/SingnupPage.resource
Resource    pages/LoginPages.resource
Resource    pages/TaskCreatePage.resource
Resource    pages/TaksPage.resource

Resource    services.resource

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False
    New Page    ${BASE_URL}

# Helpers
Get fixture
    [Arguments]    ${fixture}    ${scenario}

    ${data}    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/${fixture}.json
    ...    encoding=utf-8

    RETURN    ${data}[${scenario}]

Reset user from database
    [Arguments]    ${user}

    Clean user from database    ${user}[email]
    Insert user from database    ${user}

Create a new task from API
    [Arguments]    ${data}

    POST user session    ${data}[user]
    POST a new task    ${data}[task]

Do login
    [Arguments]    ${user}

    Submit login form   ${user}
    User shoud be logged in    ${user}[name]