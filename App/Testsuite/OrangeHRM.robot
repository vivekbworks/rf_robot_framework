# *** Settings ***
# Documentation     demo testcases for check login to orange HRM website using crendtials from keepass file
# Resource  ${RESOURCES_DIR}${/}HomePage${/}homepageKeywords.robot
# Resource    ${RESOURCES_DIR}${/}common${/}AllImports.robot
# Resource  ${RESOURCES_DIR}${/}Login${/}OrangeHRMKeywords.robot
# Default Tags  Login


# *** Test Cases ***
# Login to orange HRM site using credentials stored in keepass file
#     OrangeHRMKeywords.go to site  ${ORANGEHRMSITE}
#     login to orangeHRM