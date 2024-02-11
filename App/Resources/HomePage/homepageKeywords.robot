*** Settings ***
Documentation     demo testcases for add shoes from amazon to cart and delete it using robot framework
Library           OperatingSystem
Library     SeleniumLibrary
Resource    ${RESOURCES_DIR}${/}common${/}AllImports.robot

*** Keywords ***
go to site
    [Arguments]  ${URL}
    Open Browser  ${URL}