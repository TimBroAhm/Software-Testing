*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Category Page
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    Chrome
${LOGIN_URL}    http://localhost/help/login.php
${CATEGORY_URL}    http://localhost/help/category.php
${VALID_USER}    admin
${VALID_PASS}    admin123

*** Keywords ***
Open Browser To Category Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    id=username    ${username}
    Input Text    id=password    ${password}
    Click Button    id=loginButton

Open Category Page
    Go To    ${CATEGORY_URL}

*** Test Cases ***
Manage Category Successfully
    Login With Credentials    ${VALID_USER}    ${VALID_PASS}
    Open Category Page
    Click Button    id=addCategory
    Input Text    id=categoryName    "New Category"
    Click Button    id=saveCategory
    Page Should Contain    "Category added successfully"
