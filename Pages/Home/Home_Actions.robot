*** Keywords ***
Click On Logout Button
    [Documentation]  Clicks on element.
    Wait Until Page Contains Element  ${BUTTON_LOGOUT}
    Sleep  5s
    Click Element  ${BUTTON_LOGOUT}

Click On Bank Accounts In Side Bar
    Click Element  ${BANK_ACCOUNT_LCT}