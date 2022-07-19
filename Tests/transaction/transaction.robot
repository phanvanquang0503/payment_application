*** Settings ***
Documentation  Test suite contains all the test case of transaction function
Resource    ../../Common/init.resource
Force Tags  payment  transaction
Test Setup    Navigate Login Page And Login Successfully    ${ACCOUNTS.USER1.USERNAME}    ${ACCOUNTS.USER1.PASSWORD}

*** Test Cases ***
TC_CREATE_BANK_ACCOUNT_001: Verify Transaction Successfully When User A Input Amount Less Than Account Balance.
    [Documentation]  user can create new transaction successfully.
    [Tags]  transaction_001
    Click On "$NEW" Button At Home Page
    Verify List User Visible
    Search User B  ${SEARCH_USERB}
    Click On Uer B To Transaction
    Verify transaction page visible
    Input Amount And Note For Transaction  ${USER_01.AMOUNT}  ${USER_01.NOTE}
    Click On "PAY" Botton
    Log Out User  
    Sleep  5s
    Login User B With Valid Then Navigate To Home Page    ${ACCOUNTS.USER8.USERNAME}  ${ACCOUNTS.USER8.PASSWORD}
    # Verify account balance of user B with the amount that user A paid
    [Teardown]  Restore Amount For User A

TC_CREATE_BANK_ACCOUNT_002: Verify Transaction Unsuccessfully When Empty Amount And Don't Have A Description.
    [Documentation]  user can create new transaction successfully.
    [Tags]  transaction_002
    Click On "$NEW" Button At Home Page
    Verify List User Visible
    Search User B  ${SEARCH_USERB}
    Click On Uer B To Transaction
    Verify transaction page visible
    Verify Error Message Of Transaction
    [Teardown]  Close Browser

TC_CREATE_BANK_ACCOUNT_003: Verify Transaction Successfully When User A Input Amount Less Than Account Balance.
    [Documentation]  user can create new transaction successfully.
    [Tags]  transaction_001
    Click On "$NEW" Button At Home Page
    Verify List User Visible
    Search User B  ${SEARCH_USERB}
    Click On Uer B To Transaction
    Verify transaction page visible
    Input Amount And Note For Transaction  ${USER_01.AMOUNT}  ${USER_01.NOTE}
    Click On "PAY" Botton
    Log Out User  
    Sleep  5s
    Login User B With Valid Then Navigate To Home Page    ${ACCOUNTS.USER8.USERNAME}  ${ACCOUNTS.USER8.PASSWORD}
    # Verify account balance of user B with the amount that user A paid
    [Teardown]  Restore Amount For User A