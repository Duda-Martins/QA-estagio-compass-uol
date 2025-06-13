*** Settings ***

Documentation    Online
Resource    ../resources/base.resource

*** Test Cases ***

Web app deve estar Online
    Start Session

    Get Title    equal    Mark85 by QAx