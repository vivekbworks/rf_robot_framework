*** Settings ***
Documentation     demo testcases for login to orange HRM with credentials from keepass file
Library           OperatingSystem
Library         SeleniumLibrary
Library     ${LIBRARIES_DIR}${/}keepassHelper.py
Resource    ${RESOURCES_DIR}${/}common${/}AllImports.robot
Variables  OrangeHRMLocators.py

*** Keywords ***
go to site
    [Arguments]  ${URL}
    Open Browser  ${URL}

login to orangeHRM
    Set Log Level    NONE
    ${Cred}  keepassHelper.get_credentials_from_keepass  ${KEEPWD}  ${USER}
    Set Test Variable    ${Cred}
    Set Log Level    INFO
    enter username
    enter password
    click on login button

enter username
    Wait Until Element Is Enabled    ${username_field}  ${GLOBALWAIT}
    Input Text    ${username_field}    ${Cred}[username]

enter password
    Wait Until Element Is Enabled    ${password_field}  ${GLOBALWAIT}
    Input Text    ${password_field}    ${Cred}[password]

click on login button
    Click Element    ${login_btn}