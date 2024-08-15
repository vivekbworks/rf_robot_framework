*** Settings ***
Documentation     demo testcases for add shoes from amazon to cart and delete it using robot framework
Library           OperatingSystem
Library     SeleniumLibrary
Resource    ${RESOURCES_DIR}${/}common${/}AllImports.robot
Variables  locators.py

*** Keywords ***
go to site
    [Arguments]  ${URL}
    Open Browser  ${URL}  Chrome
    
select origin and destination
    Wait Until Element Is Enabled     ${departure}   10s
    Input Text    ${departure}    Chennai
    Wait Until Element Is Enabled     ${destination}   10s
    Input Text    ${destination}    BLR

select contry
    Wait Until Element Is Enabled     ${select_country}   10s
    Input Text    ${select_country}    Ind
    Sleep    10s