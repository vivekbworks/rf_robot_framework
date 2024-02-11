*** Settings ***
Library    OperatingSystem
Library    String
Library    Collections
Library    YAML
Suite Setup    set paths

*** Variables ***
${SEPERATOR}   ${/}
${KEEPWD}   ${EMPTY}

*** Keywords ***
set paths
    ${PATH}  Split String  ${CURDIR}  ${SEPERATOR}
    ${END}  Get Index From List  ${PATH}  App
    ${NEWEND}  Evaluate    ${END}+1
    @{APPPATH}  Get Slice From List    ${PATH}  start=0  end=${NEWEND}

#    SET APP DIR AS A GLOBAL VARIABLE
    ${APPDIR}  Catenate  SEPARATOR=${SEPERATOR}   @{APPPATH}
    Set Global Variable    ${APPDIR}

#  SET CONFIG DIR AS GLOBAL VARIABLE
    Append To List    ${APPPATH}  Config
    ${CONFIG_DIR}  Catenate  SEPARATOR=${SEPERATOR}   @{APPPATH}
    Set Global Variable    ${CONFIG_DIR}
    Remove Values From List    ${APPPATH}  Config

#  SET LIBRARIES DIR AS GLOBAL VARIABLE
    Append To List    ${APPPATH}  Libraries
    ${LIBRARIES_DIR}  Catenate  SEPARATOR=${SEPERATOR}   @{APPPATH}
    Set Global Variable    ${LIBRARIES_DIR}
    Remove Values From List    ${APPPATH}  Libraries

#  SET RESOURCES DIR AS GLOBAL VARIABLE
    Append To List    ${APPPATH}  Resources
    ${RESOURCES_DIR}  Catenate  SEPARATOR=${SEPERATOR}   @{APPPATH}
    Set Global Variable    ${RESOURCES_DIR}
    Remove Values From List    ${APPPATH}  Resources

#  SET TESTDATA DIR AS GLOBAL VARIABLE
    Append To List    ${APPPATH}  Testdata
    ${TESTDATA_DIR}  Catenate  SEPARATOR=${SEPERATOR}   @{APPPATH}
    Set Global Variable    ${TESTDATA_DIR}
    Remove Values From List    ${APPPATH}  Testdata

#  SET TESTSUITE DIR AS GLOBAL VARIABLE
    Append To List    ${APPPATH}  Testsuite
    ${TESTSUITE_DIR}  Catenate  SEPARATOR=${SEPERATOR}   @{APPPATH}
    Set Global Variable    ${TESTSUITE_DIR}
    Remove Values From List    ${APPPATH}  Testsuite

    Load Environment Variables
#
Load Environment Variables
    ${yaml_file}=    Set Variable    ${CONFIG_DIR}${SEPERATOR}config.yaml
    ${file_content}=    Get File    ${yaml_file}
    ${parsed_yaml}=    Evaluate    yaml.load('''${file_content}''', Loader=yaml.FullLoader)
    ${Dict_keys}  Get Dictionary Keys    ${parsed_yaml}
    ${Dictionary_count}=  Get Length    ${Dict_keys}
    FOR    ${key}    IN   @{Dict_keys}
        ${keyname}  Set Variable  ${key}
        ${value}  Get From Dictionary    ${parsed_yaml}    ${key}
        Set Global Variable   ${${keyname}}    ${value}
    END


