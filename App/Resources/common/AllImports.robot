*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  Collections
Library  String
Library  DateTime
Library   ${LIBRARIES_DIR}${/}keepassHelper.py

Resource  ${RESOURCES_DIR}${/}HomePage${/}rahulshetty.robot
Resource  ${RESOURCES_DIR}${/}Login${/}OrangeHRMKeywords.robot