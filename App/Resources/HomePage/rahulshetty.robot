*** Settings ***
Documentation     demo testcases for add shoes from amazon to cart and delete it using robot framework
Library           OperatingSystem
Library     SeleniumLibrary
Library    ../../../venv/Lib/site-packages/robot/libraries/XML.py
Library    ../../../venv/Lib/site-packages/robot/libraries/String.py
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

select country  
    [Arguments]  ${country}
    Wait Until Element Is Enabled     ${select_country}   10s
    Input Text    ${select_country}    Ind 
    Wait Until Element Is Visible    ${autosuggest_elements}
    ${country_list} =  Get WebElements    ${autosuggest_elements}
    # Click Element    ${country_list}[1]
    ${country_count}  Get Length    ${country_list}

    # FOR  ${country_ele_index}  IN RANGE  0  ${country_count}-1:
    #     ${country_WebElement}  Catenate  ${country_list}  [  ${country_ele_index}  ]
    #     ${country_name}  Get Text    ${country_WebElement}
    #     if ${country} == ${country_name}:
    #         Click Element    ${country_name}
    # END

    FOR    ${country_ele_index}    IN RANGE    START=0   ${country_count}-1    
        ${country_WebElement}    Catenate  ${country_list}  [  ${country_ele_index}  ]
        ${country_name}  Get Text    ${country_WebElement}
        if ${country} == ${country_name}:
            Click Element    ${country_name}
    END
    Sleep    5s