*** Settings ***
Resource    ../../Common/init.resource

*** Keywords ***
User Logs In To Home Page
    [Documentation]    Access to FXB Home page based on corresponding environment.
    FOR    ${index}    IN RANGE    0    3
        ${status} =    Run Keyword And Return Status    Run Keywords
        ...    User Goes To Payment Login Page    ${ENVAIROMENTS.DEV.SIGIN_URL}
        ...    AND    Login To Payment App    ${ACCOUNTS.USER1.USERNAME}    ${ACCOUNTS.USER1.PASSWORD}
        Run Keyword Unless    ${status}    Close Browser
        EXIT FOR LOOP IF    ${status}
    END

Login To Payment App
    [Arguments]    ${username}    ${password}
    [Documentation]    Login to FXB with given username and password.
    Input Userame And Password    ${username}    ${password}
    Click On Login Button

Verify Login Success
    [Documentation]    Veri${EXECDIR}/Pages/Home/Home_Actions.robotfies some contents on Home page are displayed.
    Wait Until Page Contains Element    ${HOME}
    Wait Until Page Contains Element    ${MY_ACCOUNT}
    Wait Until Page Contains Element    ${BANK_ACCOUNT_LCT}
    Wait Until Page Contains Element    ${NOTIFICATION}

Logout Payment Application And Close Browser
    [Documentation]    Clicks on Logout button and close this browser.
    Click On Logout Button
    Close Browser

Create New Bank Account
    Input Text  ${BANKNAME_LCT}  ${BANK_ACCOUNT.BANK_NAME}
    Input Text  ${ROUTING_NUMBER_LCT}  ${BANK_ACCOUNT.ROUTING_NUMBER}
    Input Text  ${ACCOUNT_NUMBER_LCT}  ${BANK_ACCOUNT.ACCOUNT_NUMBER}
    Click Button Save
