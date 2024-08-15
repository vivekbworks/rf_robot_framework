*** Settings ***
Resource  ${RESOURCES_DIR}${/}HomePage${/}homepageKeywords.robot
Resource    ${RESOURCES_DIR}${/}common${/}AllImports.robot
Test Tags  assignment


*** Test Cases ***
verify source destination and contry option is working
    [Tags]  assignment
    rahulshetty.go to site  ${URL}
    select origin and destination