*** Settings ***
Documentation  Test suite contains all the test case of sign in and sign up function
Resource    ../../Common/init.resource
Force Tags  payment  bankaccounts
Test Setup    Navigate Login Page And Login Successfully    ${ACCOUNTS.USER1.USERNAME}    ${ACCOUNTS.USER1.PASSWORD}
Test Teardown  Close Browser

*** Test Cases ***
TC_CREATE_BANK_ACCOUNT_001: Check User Create Bank Account Successfully With Valid Data
    [Documentation]  Verify that user can create new bank account successfully.
    [Tags]  create_bankaccount_001
    Click On Bank Accounts In Side Bar
    Verify Bank Account Page Visible
    Click On Create Button
    Create New Bank Account    ${BANK_ACCOUNT_01.BANK_NAME}  ${BANK_ACCOUNT_01.ROUTING_NUMBER}  ${BANK_ACCOUNT_01.ACCOUNT_NUMBER}
    Click Button Save
    Verify Create Bank Account Successfully
    [Teardown]    Close Browser

TC_CREATE_BANK_ACCOUNT_002: Check User Create Bank Account with Invalid Bank Name
    [Documentation]  Verify that user create new bank account unsuccessfully.
    [Tags]  create_bankaccount_002
    Click On Bank Accounts In Side Bar
    Verify Bank Account Page Visible
    Click On Create Button
    Create New Bank Account    ${BANK_ACCOUNT_02.BANK_NAME}  ${BANK_ACCOUNT_02.ROUTING_NUMBER}  ${BANK_ACCOUNT_02.ACCOUNT_NUMBER}
    Verify Create Bank Account Unuccessful  ${CONTENT_ERROR_BANKNAME}  ${CONTENT_ERROR_ROUTING}  ${ERROR_ACCOUNT_DIGITS12}
    [Teardown]    Close Browser

TC_CREATE_BANK_ACCOUNT_003: Check User Create Bank Account Unsuccessful When Have Invalid Routing Number With Data Is Charator
    [Documentation]  Verify that User Create Bank Account Unsuccessful When User Inputs Routing Number With Data Is Charator
    [Tags]  create_bankaccount_003
    Click On Bank Accounts In Side Bar
    Verify Bank Account Page Visible
    Click On Create Button
    Create New Bank Account    ${BANK_ACCOUNT_03.BANK_NAME}  ${BANK_ACCOUNT_03.ROUTING_NUMBER}  ${BANK_ACCOUNT_03.ACCOUNT_NUMBER}
    Verify Create Bank Account Unuccessful  ${CONTENT_ERROR_BANKNAME}  ${CONTENT_ERROR_ROUTING}  ${ERROR_ACCOUNT_DIGITS12}
    [Teardown]    Close Browser

TC_CREATE_BANK_ACCOUNT_004: Check User Create Bank Account Unsuccessful When Have Invalid Routing Number Less Than 9 Number
    [Documentation]  Verifies that User Create Bank Account Unsuccessful When User Inputs Routing Number Less Than 9 Number
    [Tags]  create_bankaccount_004
    Click On Bank Accounts In Side Bar
    Verify Bank Account Page Visible
    Click On Create Button
    Create New Bank Account    ${BANK_ACCOUNT_04.BANK_NAME}  ${BANK_ACCOUNT_04.ROUTING_NUMBER}  ${BANK_ACCOUNT_04.ACCOUNT_NUMBER}
    Verify Create Bank Account Unuccessful  ${CONTENT_ERROR_BANKNAME}  ${CONTENT_ERROR_ROUTING}  ${ERROR_ACCOUNT_DIGITS12}
    [Teardown]    Close Browser

TC_CREATE_BANK_ACCOUNT_005: Check User Create Bank Account Unsuccessful When Have Invalid Routing Number More Than 9 Number
    [Documentation]  Verifies that User Create Bank Account Unsuccessful When User Inputs Routing Number More Than 9 Number
    [Tags]  create_bankaccount_005
    Click On Bank Accounts In Side Bar
    Verify Bank Account Page Visible
    Click On Create Button
    Create New Bank Account    ${BANK_ACCOUNT_05.BANK_NAME}  ${BANK_ACCOUNT_05.ROUTING_NUMBER}  ${BANK_ACCOUNT_05.ACCOUNT_NUMBER}
    Verify Create Bank Account Unuccessful  ${CONTENT_ERROR_BANKNAME}  ${CONTENT_ERROR_ROUTING}  ${ERROR_ACCOUNT_DIGITS12}
    [Teardown]    Close Browser

TC_CREATE_BANK_ACCOUNT_006: Check User Create Bank Account Unsuccessful When Have Invalid Account Number With Data is Charactor
    [Documentation]  Verifies that User Create Bank Account Unsuccessful When User Inputs Account Number With Data is Charactor
    [Tags]  create_bankaccount_006
    Click On Bank Accounts In Side Bar
    Verify Bank Account Page Visible
    Click On Create Button
    Create New Bank Account    ${BANK_ACCOUNT_06.BANK_NAME}  ${BANK_ACCOUNT_06.ROUTING_NUMBER}  ${BANK_ACCOUNT_06.ACCOUNT_NUMBER}
    Verify Create Bank Account Unuccessful  ${CONTENT_ERROR_BANKNAME}  ${CONTENT_ERROR_ROUTING}  ${CONTENT_ERROR_ACCOUNT}
    [Teardown]    Close Browser

TC_CREATE_BANK_ACCOUNT_007: Check User Create Bank Account Unsuccessful When Have Invalid Account Number More Than 12 Digits
    [Documentation]  Verifies that User Create Bank Account Unsuccessful When User Inputs Account Number More Than 12 Digits
    [Tags]  create_bankaccount_007
    Click On Bank Accounts In Side Bar
    Verify Bank Account Page Visible
    Click On Create Button
    Create New Bank Account    ${BANK_ACCOUNT_07.BANK_NAME}  ${BANK_ACCOUNT_07.ROUTING_NUMBER}  ${BANK_ACCOUNT_07.ACCOUNT_NUMBER}
    Verify Create Bank Account Unuccessful  ${CONTENT_ERROR_BANKNAME}  ${CONTENT_ERROR_ROUTING}  ${ERROR_ACCOUNT_DIGITS12}
    [Teardown]    Close Browser

TC_CREATE_BANK_ACCOUNT_008: Check User Create Bank Account Unsuccessful When Empty Data
    [Documentation]  Verifies that User Create Bank Account Unsuccessful When Empty Data
    [Tags]  create_bankaccount_008
    Click On Bank Accounts In Side Bar
    Verify Bank Account Page Visible
    Click On Create Button
    Click Element  ${BANKNAME_LCT}
    Click Element  ${ROUTING_NUMBER_LCT}
    Click Element  ${ACCOUNT_NUMBER_LCT}
    Click Element  ${FORM}
    Verify Create Bank Account Unuccessfully  ${EMPTY_BANKNAME}  ${EMPTY_ROUTING}  ${EMPTY_ACCOUNT}
    [Teardown]    Close Browser
