*** Settings ***
Resource  Register_Locators.robot
Variables    register_data.yaml
Variables    ../../Common/Settings.yaml

*** Keywords ***
Fill In Form Register
    Input Text  ${FIRST_NAME_LCT}  ${REGISTER.USER1.FIRSTNAME}
    Input Text  ${LASS_NAME_LCT}  ${REGISTER.USER1.LASTNAME}
    Input Text  ${USERNAME_LCT}  ${REGISTER.USER1.USERNAME}
    Input Password  ${PASSWORD_LCT}  ${REGISTER.USER1.PASSWORD}
    Input Password  ${CONFRIM_LCT}  ${REGISTER.USER1.PASSWORD}
    Sleep  3s

Click On Signup Button
    Click Element  ${BUTTON_SIGNUP}
