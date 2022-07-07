*** Settings ***
Resource    Login_Actions.robot
Resource    ../../Common/Common_Keywords.robot
Variables    ../../Common/Settings.yaml

*** Keywords ***
User Goes To Payment Login Page
    [Arguments]    ${web_url}
    Open Browser And Go To Login Page    ${web_url}
    Close Browser

*** Test Cases ***
TC1: Should User Login With Valid Data
    [Tags]  tcs_01
    User Goes To Payment Login Page    ${ENVAIROMENTS.DEV.SIGIN_URL}