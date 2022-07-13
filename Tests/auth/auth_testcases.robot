*** Settings ***
Documentation  Test suite contains all the test case of sign in and sign up function
Resource    ../../Common/init.resource
Force Tags  payment  signin
Test Teardown  Close Browser

*** Test Cases ***
TC_LOGIN_001: Should User Login Successfully With Valid Data
    [Documentation]  Verifies that user can login successfully.
    [Template]  Login With Valid Credentials Should Pass
    [Tags]  signin_001
    ${ACCOUNTS.USER1.USERNAME}  ${ACCOUNTS.USER1.PASSWORD}
    ${ACCOUNTS.USER2.USERNAME}  ${ACCOUNTS.USER2.PASSWORD}
    ${ACCOUNTS.USER3.USERNAME}  ${ACCOUNTS.USER3.PASSWORD}
    ${ACCOUNTS.USER4.USERNAME}  ${ACCOUNTS.USER4.PASSWORD}
    ${ACCOUNTS.USER5.USERNAME}  ${ACCOUNTS.USER5.PASSWORD}

TC_LOGIN_002: Should User Login Unsuccessfully With Invalid Data
    [Documentation]  Verifies that user can not login with invalid data.
    [Template]  Login With Invalid Credentials Should Fail
    [Tags]  signin_002
    ${ACCOUNTS.USER6.USERNAME}  ${ACCOUNTS.USER6.PASSWORD}
    ${ACCOUNTS.USER6.USERNAME}  ${ACCOUNTS.USER6.PASSWORD}
    Katharina Bernier           ${ACCOUNTS.USER6.PASSWORD}
    katharina_bernier           ${ACCOUNTS.USER6.PASSWORD}
    Katharina_                  ${ACCOUNTS.USER6.PASSWORD}

TC_LOGIN_003: Should User Login Unsuccessfully With Invalid Data - Password < 4
    [Documentation]  Verifies that user can not login with 
    ...    invalid username and pass word have less than 4 character.
    [Template]  Login With Invalid Data Should Be Fail
    [Tags]  signin_003
    ${ACCOUNTS.USER7.USERNAME}  ${ACCOUNTS.USER7.PASSWORD}
    ${ACCOUNTS.USER7.USERNAME}  ${ACCOUNTS.USER7.PASSWORD}
    Katharina Bernier           ${ACCOUNTS.USER7.PASSWORD}
    katharina_bernier           ${ACCOUNTS.USER7.PASSWORD}
    Katharina_                  ${ACCOUNTS.USER7.PASSWORD}

TC_LOGIN_004: Should User Login Unsuccessfully With Empty Username - Password < 4
    [Documentation]  Verifies that user can not login with empty username and password have less than 4 character
    [Template]  Login With Empty Username And Invalid Password Should Be Fail
    [Tags]  signin_004
    ${EMPTY}  ${ACCOUNTS.USER7.PASSWORD}

TC_LOGIN_005: Should Allow A Visitor To Sign-Up, Login, And Logout
    [Documentation]  Verifies that user can sign up after that login with data just signup and log out
    [Setup]  User Goes To Payment Login Page  ${ENVAIROMENTS.DEV.SIGNUP_URL}
    [Tags]  signin_005
    Verify And Register Successfully With Valid Data
    Login With Data Registed Should Be Pass  ${REGISTER.USER1.USERNAME}  ${REGISTER.USER1.PASSWORD}
