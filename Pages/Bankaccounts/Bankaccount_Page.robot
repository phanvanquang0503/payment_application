*** Settings ***
Resource    ../../Common/init.resource

*** Keywords ***
Verify Bank Account Page Visible
    Wait Until Element Is Visible  ${BUTTON_CREATE}
    Location Should Be  ${ENVAIROMENTS.DEV.BANKACCOUNT}

Create New Bank Account
    [Arguments]  ${bank_name}  ${routing_number}  ${account_number}
    Input Text  ${BANKNAME_LCT}  ${bank_name}
    Input Text  ${ROUTING_NUMBER_LCT}  ${routing_number}
    Input Text  ${ACCOUNT_NUMBER_LCT}  ${account_number}

Verify Create Bank Account Successfully
    Wait Until Element Is Visible  ${BANK_NAME_VRF}

Verify Create Bank Account Unuccessful
    [Arguments]    ${bankname_error}    ${routing_error}    ${account_error}
    ${status1}=    Run Keyword And Return Status  Element Should Be Visible  ${BANKNAME_ERROR_MSG}  ${bankname_error}
    ${status2}=    Run Keyword And Return Status  Element Should Be Visible    ${ROUTING_ERROR_MSG}  ${routing_error}
    ${status3}=    Run Keyword And Return Status  Element Should Be Visible    ${ACCOUNT_ERROR_MSG}  ${account_error}
    IF  ${status1}==${TRUE}
        Page Should Contain Element  ${BANKNAME_ERROR_MSG}  ${bankname_error}
        Element Should Be Disabled  ${BUTTON_SAVE}
    ELSE IF  ${status2}==${TRUE}
        Page Should Contain Element  ${ROUTING_ERROR_MSG}  ${routing_error}
        Element Should Be Disabled  ${BUTTON_SAVE}
    ELSE IF  ${status3}==${TRUE}
        Page Should Contain Element  ${ACCOUNT_ERROR_MSG}  ${account_error}
        Element Should Be Disabled  ${BUTTON_SAVE}
    END

Verify Create Bank Account Unuccessfully
    [Arguments]    ${bankname_error}    ${routing_error}    ${account_error}
    Page Should Contain Element  ${BANKNAME_ERROR_MSG}  ${bankname_error}
    Page Should Contain Element  ${ROUTING_ERROR_MSG}  ${routing_error}
    Page Should Contain Element  ${ACCOUNT_ERROR_MSG}  ${account_error}
