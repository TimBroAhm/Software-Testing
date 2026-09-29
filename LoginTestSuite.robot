*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}             Chrome
${URL}                 http://172.16.250.15:8080/help/login.php
${USERURL}             http://172.16.250.15:8080/help/officer_dashboard.php
${VALID USERNAME}      4969
${VALID PASSWORD}      epss123
${INVALID USERNAME}    9909
${INVALID PASSWORD}    uuuuu677

*** Test Cases ***

Login With Valid Credentials
    Open Login Page
    Input Credentials    ${VALID USERNAME}    ${VALID PASSWORD}
    Submit Login Form
    Wait Until Location Contains    officer_dashboard.php    timeout=10s
    Log    ✅ Successfully logged in and redirected to dashboard
    [Teardown]    Close Browser

Login With Invalid Username And Password
    Open Login Page
    Input Credentials    ${INVALID USERNAME}    ${INVALID PASSWORD}
    Submit Login Form
    Wait Until Location Is    ${URL}    timeout=10s
    Log    ✅ Invalid login attempt stayed on login page
    [Teardown]    Close Browser

*** Keywords ***

Open Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    timeout=10s

Input Credentials
    [Arguments]    ${username}    ${password}
    Input Text    name=username    ${username}
    Input Text    name=password    ${password}

Submit Login Form
    Click Element    xpath=//button[@type='submit']    # Click login button using XPath
    Sleep    2s    # Add a short sleep to give the page time to react
