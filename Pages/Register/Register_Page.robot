*** Settings ***
Resource    Register_Actions.robot
Resource    ../Home/Home_Actions.robot

*** Keywords ***

Verify And Register Successfully With Valid Data
    Location Should Be    ${ENVAIROMENTS.DEV.SIGNUP_URL}
    Page Should Contain Element  ${REGISTER_LCT}  ${CONTAIN_REGISTER}
    Fill In Form Register
    Click On Signup Button
    Sleep  5s
    Verify Signin Page Should Be Visible