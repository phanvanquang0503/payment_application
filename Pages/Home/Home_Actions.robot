*** Settings ***
Resource          Home_Locators.robot
Resource          ../../Common/Common_Keywords.robot
Variables         ../../Common/Settings.yaml
Resource          ../Login/Login_Page.robot

*** Keywords ***
Click On Logout Button
    [Documentation]    Clicks on element.
    Wait Until Page Contains Element    ${BUTTON_LOGOUT}
    Click Element    ${BUTTON_LOGOUT}
