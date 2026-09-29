*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary
Library           ZapLibrary    http://192.168.10.20:8081/help/loginn.php
Suite Setup       Initialize Test Environment
Suite Teardown    Run ZAP Active Scan And Close

*** Variables ***
${BROWSER}                Chrome
${LOGIN_URL}             http://192.168.10.20:8081/help/loginn.php
${SQL_INJECTION_PAYLOAD}  ' OR '1'='1--
${ZAP_API}               http://192.168.10.20:8081/help/loginn.php
${EXPECTED_RESPONSE}      Invalid username or Password
${ZAP_CONTEXT_NAME}       HelpDeskContext
${TARGET}                 http://localhost/help/

*** Keywords ***
Initialize Test Environment
    Create Session    helpdesk    ${LOGIN_URL}    proxies=http://localhost:8081
    Open Browser    ${LOGIN_URL}    ${BROWSER}    options=add_argument("--proxy-server=http://localhost:8081")
    Maximize Browser Window

Submit SQL Injection Via UI
    Input Text    id=username    ${SQL_INJECTION_PAYLOAD}
    Input Text    id=password    ${SQL_INJECTION_PAYLOAD}
    Click Button    id=loginButton
    Wait Until Page Contains    ${EXPECTED_RESPONSE}    timeout=5s

Submit SQL Injection Via API
    &{payload}=    Create Dictionary    username=${SQL_INJECTION_PAYLOAD}    password=${SQL_INJECTION_PAYLOAD}
    ${resp}=    Post Request    helpdesk    /help/login.php    data=${payload}
    Should Contain    ${resp.text}    ${EXPECTED_RESPONSE}

Run ZAP Active Scan And Close
    Zap New Context    ${ZAP_CONTEXT_NAME}
    Zap Include In Context    ${ZAP_CONTEXT_NAME}    ${TARGET}.*
    Zap Spider Target    ${TARGET}
    Zap Wait For Spider    60
    Zap Active Scan    ${TARGET}
    Zap Wait For Active Scan    60
    ${alerts}=    Zap Get Alerts
    Log    ZAP Alerts:\n${alerts}
    Close Browser

*** Test Cases ***
SQL Injection Test Through UI and API
    Submit SQL Injection Via UI
    Submit SQL Injection Via API
