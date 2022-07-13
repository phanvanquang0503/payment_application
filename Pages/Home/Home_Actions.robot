*** Keywords ***
Click On Logout Button
    [Documentation]    Clicks on element.
    Wait Until Page Contains Element    ${BUTTON_LOGOUT}
    Sleep  5s
    Click Element    ${BUTTON_LOGOUT}

Click Button Save
    Click Element    ${BUTTON_SAVE}