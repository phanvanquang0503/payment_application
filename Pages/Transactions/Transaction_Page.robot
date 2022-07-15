*** Settings ***
Resource    ../../Common/init.resource

*** Keywords ***
Verify Transaction Page Visible
    Wait Until Element Is Visible  ${AMOUNT_LCT}
    Wait Until Element Is Visible  ${NOTE_LCT}
    Location Should Be  ${ENVAIROMENTS.DEV.TRANSACTION}

Verify List User Visible
    Wait Until Element Is Visible  ${LIST_USER}
    Wait Until Element Is Visible  ${USERB}

Login User B With Valid Then Navigate To Home Page
    [Arguments]  ${username}  ${password}
    Location Should Be  ${ENVAIROMENTS.DEV.SIGIN_URL}
    Login To Payment App  ${username}  ${password}

Verify account balance of user B with the amount that user A paid
    Page Should Contain Element  //h6[@data-test='sidenav-username']  phanvanquang0503

Restore Amount For User A
    Sleep  3s
    Click On "$NEW" Button At Home Page
    Verify List User Visible
    Search User A  ${SEARCH_USERA}
    Click On Uer A To Transaction
    Verify transaction page visible
    Input Amount And Note For Transaction  ${USER_01.AMOUNT}  ${USER_01.NOTE}
    Click On "PAY" Botton
    Log Out User
    Close Browser

Verify Error Message Of Transaction
    Click Element  ${AMOUNT_LCT}
    Click Element  ${NOTE_LCT}
    Click Element  ${MAIN}
    Sleep  2s
    Page Should Contain Element  ${ERROR_AMOUT}  ${MESSAGE_ERROR_AMOUNT}
    Page Should Contain Element  ${ERROR_DESC}  ${MESSAGE_ERROR_DESC}
