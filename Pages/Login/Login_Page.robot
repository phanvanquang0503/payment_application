*** Settings ***
Resource  Login_Actions.robot
Resource  ../../Common/Common_Keywords.robot
Resource  ../Home/Home_Page.robot
Variables  ../../Common/Settings.yaml

*** Keywords ***
User Goes To Payment Login Page
    [Arguments]  ${web_url}
    Open Browser And Go To Login Page  ${web_url}

Verify That Logout Successfully
    Wait Until Location Is  ${ENVAIROMENTS.DEV.SIGIN_URL}

Login With Valid Credentials Should Pass
    [Arguments]  ${username}  ${password}
    User Goes To Payment Login Page  ${ENVAIROMENTS.DEV.SIGIN_URL}
    Login To Payment App    ${username}  ${password}
    Verify Login Success
    [Teardown]  Close Browser

Login With Invalid Credentials Should Fail
    [Arguments]  ${username}  ${password}
    User Goes To Payment Login Page  ${ENVAIROMENTS.DEV.SIGIN_URL}
    Input Userame And Password  ${username}  ${password}
    Click On Login Button
    Page Should Contain Element  ${SIGNIN_ERROR_MSG}
    [Teardown]  Close Browser

Login With Invalid Data Should Be Fail
    [Arguments]  ${username}  ${password}
    User Goes To Payment Login Page  ${ENVAIROMENTS.DEV.SIGIN_URL}
    Input Userame And Password  ${username}  ${password}
    Click Element    ${CHECK_REMEMBER}
    Wait Until Element Contains  ${PASSWORD_ERROR_MSG}  ${MSG_ERROR_PW}
    Element Should Be Disabled  ${BUTTON_LOGIN}
    [Teardown]  Close Browser

Login With Empty Username And Invalid Password Should Be Fail
    [Arguments]  ${username}  ${password}
    User Goes To Payment Login Page  ${ENVAIROMENTS.DEV.SIGIN_URL}
    Input Userame And Password  ${username}  ${password}
    Click Element  ${CHECK_REMEMBER}
    Wait Until Element Contains  ${PASSWORD_ERROR_MSG}  ${MSG_ERROR_PW}
    Wait Until Element Contains  ${USERNAME_ERROR_MSG}  ${MSG_ERROR_USN}
    Element Should Be Disabled  ${BUTTON_LOGIN}
    [Teardown]  Close Browser

Login With Data Registed Should Be Pass
    [Arguments]  ${username}  ${password}
    Login To Payment App    ${username}  ${password}
    Sleep  5s
    Verify Login Success
    [Teardown]  Close Browser

