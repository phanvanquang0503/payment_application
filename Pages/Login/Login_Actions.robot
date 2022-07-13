*** Keywords ***
Input Userame And Password
    [Arguments]  ${username}  ${password}
    Wait Until Keyword Succeeds    1s    5s  Input Text  ${USERNAME_LCT}  ${username}
    Wait Until Keyword Succeeds    1s    5s  Input Password  ${PASSWORD_LCT}  ${password}

Click On Login Button
    Click Element  ${BUTTON_LOGIN}

Verify Signin Page Should Be Visible
    Location Should Be   ${ENVAIROMENTS.DEV.SIGIN_URL}
