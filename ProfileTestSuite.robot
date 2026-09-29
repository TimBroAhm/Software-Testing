*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}        Chrome
${LOGIN_URL}     http://172.16.250.15:8080/help/login.php
${PROFILE_URL}    http://172.16.250.15:8080/help/profile.php
${VALID_USER}     4969
${VALID_PASS}     epss123

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    id=username    ${username}
    Input Text    id=password    ${password}
    Click Button    xpath=//button[@type='submit']    # Using XPath to click the login button
Open Profile Page
    Go To    ${PROFILE_URL}
    Wait Until Page Contains Element    id=editProfile    timeout=5s

*** Test Cases ***
Manage Profile Successfully
    Login With Credentials    ${VALID_USER}    ${VALID_PASS}
    Open Profile Page
    Click Button    name=edit
    Input Text    id=dep    GS & ICT Directorate
    Click Button     xpath=//button[@type='submit'  
    Page Should Contain    Profile updated

Failed Profile Management (invalid category selection)
    Login With Credentials    ${VALID_USER}    ${VALID_PASS}
    Open Profile Page
    Click Button    id=editProfile
    Clear Element Text    id=category
    Click Button    id=saveProfile
    Page Should Contain    Please select a valid category
