*** Settings ***
Resource    ../../Common/init.resource

*** Keywords ***

Click On "$NEW" Button At Home Page
    Click Element  ${NEW_TRANS}

Search User A
    [Arguments]  ${usera}
    Input Text  ${SEARCH}  ${usera}

Search User B
    [Arguments]  ${userb}
    Input Text  ${SEARCH}  ${userb}

Click On Uer A To Transaction
    Click Element  ${USERA}

Click On Uer B To Transaction
    Click Element  ${USERB}

Input Amount And Note For Transaction
    [Arguments]  ${amount}    ${note}
    Input Amount  ${amount}
    Input A Note  ${note}

Input Amount
    [Arguments]  ${amount}
    Input Text  ${AMOUNT_LCT}  ${amount}

Input A Note
    [Arguments]  ${note}
    Input Text  ${NOTE_LCT}  ${note}

Click On "PAY" Botton
    Click Element  ${PAY}

Log Out User
    Click On Logout Button