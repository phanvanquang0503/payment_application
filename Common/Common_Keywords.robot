*** Settings ***
Resource    ${EXECDIR}/Common/init.resource

*** Keywords ***
Open Browser And Go To Login Page
    [Documentation]    Check ${BROWSER} value for the system before running (stored in Settings.robot).
    ...    \n*login_url*:    login URL with specific environment in Settings.yaml file.
    ...    \nExample:
    ...    \n| `Open Browser And Go To Login Page` | ${login_url} |
    [Arguments]    ${login_url}
    ${chrome_status} =    Run Keyword And Return Status
    ...    Should Be Equal As Strings    ${BROWSER}    Chrome    ignore_case=True
    ${firefox_status} =    Run Keyword And Return Status
    ...    Should Be Equal As Strings    ${BROWSER}    Firefox    ignore_case=True
    ${ie_status} =    Run Keyword And Return Status
    ...    Should Be Equal As Strings    ${BROWSER}    IE    ignore_case=True
    Run Keyword If    ${chrome_status}    Open Chrome Browser And Go To Login Page    ${login_url}
    ...    ELSE IF    ${firefox_status}    Open Firefox Browser And Go To Login Page    ${login_url}
    ...    ELSE IF    ${ie_status}    Open IE Browser And Go To Login Page    ${login_url}
    ...    ELSE    Fail    ERROR! Unidentified browser:    ${BROWSER}

Open Chrome Browser And Go To Login Page
    [Documentation]    Open Chrome Browser and go to login page.
    ...    \n*login_url*:    login URL with specific environment in Settings.yaml file.
    ...    \nExample:
    ...    \n| `Open Chrome Browser And Go To Login Page` | ${login_url} |
    [Arguments]    ${login_url}
    ${system}=    Evaluate    platform.system()    platform
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_experimental_option    useAutomationExtension    ${False}
    Run Keyword If    '${system}'=='Linux'    Run Keywords
    ...    Call Method    ${chrome_options}    add_argument    test-type
    ...    AND    Call Method    ${chrome_options}    add_argument    ignore-certificate-errors
    ...    AND    Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...    AND    Call Method    ${chrome_options}    add_argument    --headless
    ...    AND    Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...    AND    Call Method    ${chrome_options}    add_argument    --no-sandbox
    ${driver_path}=    Run Keyword If    '${system}'=='Linux'    Set Variable    ${CHROME_DRIVER_PATH_UNIX}
    ...    ELSE    Set Variable    ${EXECDIR}/${CHROME_DRIVER_PATH_WINS}
    ${kwargs}=    BuiltIn.Create Dictionary    executable_path=${driver_path}
    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=${driver_path}
    Run Keyword If    '${system}'=='Windows'    Maximize Browser Window
    Go to    ${login_url}

Open Firefox Browser And Go To Login Page
    [Documentation]    Open Firefox Browser and go to login page.
    ...    \n*login_url*:    login URL with specific environment in Settings.yaml file.
    ...    \nExample:
    ...    \n| `Open Firefox Browser And Go To Login Page` | ${login_url} |
    [Arguments]    ${login_url}
    ${system}=    Evaluate    platform.system()    platform
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Run Keyword If    '${system}'=='Linux'.
    ...    Call Method    ${firefox_options}    add_argument    --headless
    ${driver_path}=    Run Keyword If    '${system}'=='Linux'    Set Variable    ${FIREFOX_DRIVER_PATH_UNIX}
    ...    ELSE    Set Variable    ${FIREFOX_DRIVER_PATH_WINS}
    ${kwargs}=    BuiltIn.Create Dictionary    executable_path=${driver_path}
    Create Webdriver    Firefox    firefox_options=${firefox_options}    executable_path=${driver_path}
    Run Keyword If    '${system}'=='Windows'    Maximize Browser Window
    Go To    ${login_url}

Open IE Browser And Go To Login Page
    [Documentation]    Open Internet Explorer and go to login page.
    ...    \n*login_url*:    login URL with specific environment in Settings.yaml file.
    ...    \nExample:
    ...    \n| `Open IE Browser And Go To Login Page` | ${login_url} |
    [Arguments]    ${login_url}
    ${system}=    Evaluate    platform.system()    platform
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].InternetExplorerOptions()    sys, selenium.webdriver
    Run Keyword If    '${system}'=='Linux'
    #Todo
    Go To    ${login_url}

Click On Element
    [Arguments]    ${locator}
    [Documentation]    Clicks the element identified by ``locator``.
    ...    \n*locator*:    locator of the element
    ...    \nExample:
    ...    \n| `Click On Element` | ${VALIDATE_SANCTION_BTN} |
    Scroll To Element    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Get Text Element
    [Arguments]    ${locator}
    [Documentation]    Gets the value of element identified by ``locator``.
    ...    \n*locator*:    locator of the element
    ...    \nExample:
    ...    \n| `Get Text Element` | ${THB_EQUIVALENCE_LOCATOR} |
    Wait Until Keyword Succeeds    1s    10s    Wait Until Element Is Visible    ${locator}
    ${return_text} =    Wait Until Keyword Succeeds    3x    10s    Get Text    ${locator}
    [Return]    ${return_text}

Verify The Value Of Element Should Be Correct
    [Arguments]    ${trans_result_locator}    ${result_message}
    [Documentation]    Verifies that the value of element identified by ``trans_result_locator``
    ...    should be matched with expected message.
    ...    \n*trans_result_locator*:    locator of the element
    ...    \n*result_message*:    expected message
    ...    \nExample:
    ...    \n| `Verify The Value Of Element Should Be Correct` | ${ERR_MSG_TOOLTIP} | ${expected_message} |
    ${trans_result_value} =    Get Text Element    ${trans_result_locator}
    Should Be Equal As Strings    ${result_message}    ${trans_result_value}

Verify The Transaction Result Message
    [Arguments]    ${locator}    ${message}
    [Documentation]    Verifies that the transaction message result should be correct.
    ...    \n*locator*:    locator of the element
    ...    \n*message*:    expected message
    ...    \nExample:
    ...    \n| `Verify The Transaction Result Message` | ${SUCCESS_TRANSACTION_MSG_LOCATOR} | ${SUCCESS_MESSAGE} |
    Verify The Value Of Element Should Be Correct    ${locator}    ${message}

Verify The Receipt ID Should Have Format
    [Arguments]    ${prefix_receipt_id}    ${receipt_id_locator}
    [Documentation]    Verifies Receipt ID should be matched with its rules: <Transaction_Name><25 characters[number or alphabet]>
    ...    \n*prefix_receipt_id*:    prefix of the Receipt ID (Buy Bank Note: BNB, Sell Bank Note: BNS)
    ...    \n*receipt_id_locator*:    locator of the Receipt ID on UI
    ...    \nExample:
    ...    \n| `Verify The Receipt ID Should Have Format` | BNB | ${RECEIPT_ID_LOCATOR} |
    ...    \n| `Verify The Receipt ID Should Have Format` | BNS | ${RECEIPT_ID_LOCATOR} |
    ...    \n| `Verify The Receipt ID Should Have Format` | ${RECEIPT_ID_PREFIX} | ${RECEIPT_ID_LOCATOR} |
    ${receipt_id_locator} =    Get Text Element    ${receipt_id_locator}
    Should Match Regexp    ${receipt_id_locator}    ${prefix_receipt_id}([A-Z]|[0-9]){25}

Verify The Paid Amount Should Be Equal With Total Amount Before
    [Arguments]    ${paid_locator}    ${thb_total_amount}
    [Documentation]    Verifies the value of element identified by ``paid_locator``
    ...    on transaction result section should be equal ``total_amount`` of Buy Bank Note.
    ...    \n*paid_locator*:    locator of the PAID Amount attribute on UI
    ...    \n*thb_total_amount*:    the value of Total Amount field on transaction form
    ...    \nExample:
    ...    \n| `Verify The Paid Amount Should Be Equal With Total Amount Before` | ${PAID_LOCATOR} | THB${SPACE}${TOTAL_AMOUNT_THB} |
    Verify The Value Of Element Should Be Correct    ${paid_locator}    ${thb_total_amount}

Verify The Paid Amount Should Be Equal With CCY Amount Before
    [Arguments]    ${paid_locator}    ${ccy_amount}
    [Documentation]    Verifies the value of element identified by ``paid_locator``
    ...    on transaction result section should be equal ``ccy_amount`` of Sell Bank Note.
    ...    \n*paid_locator*:    locator of the PAID Amount attribute on UI
    ...    \n*ccy_amount*:    the value of CCY Amount field on transaction form
    ...    \nExample:
    ...    \n| `Verify The Paid Amount Should Be Equal With CCY Amount Before` | ${PAID_LOCATOR} | USD${SPACE}${CCY_AMOUNT_TXT} |
    Verify The Value Of Element Should Be Correct    ${paid_locator}    ${ccy_amount}

Convert Amount From String To Number
    [Arguments]    ${amount}
    [Documentation]    Replaces ``,`` in the given ``string`` with empty value
    ...    and converts the value to number format.
    ...    \n*amount*:    the value of amount after getting from UI
    ...    \nExample:
    ...    \n| `Convert Amount From String To Number` | ${total_amount} |
    ${amount} =    Replace String    ${amount}    ,    ${EMPTY}
    ${amount} =    Convert To Number    ${amount}    precision=2
    [Return]    ${amount}

Update Value For Attribute On Data Dictionary
    [Arguments]    ${dict_data}    ${key_data}    ${value_data}
    [Documentation]    This keyword is used to copy a new dictionary based on the original dictionary.
    ...    After performing update the value of the attribute on the new dictionary.
    ...    \n*dict_data*:    the original dictionary
    ...    \n*key_data*:    the field name
    ...    \n*value_data*:    the value which needs to update with corresponding field name
    ...    \nExample:
    ...    \n| `Update Value For Attribute On Data Dictionary` | ${cus_info} | ${FNAME_ATTR} | ${EMPTY} |
    ${dict_copy} =    Copy Dictionary    ${dict_data}
    Set To Dictionary    ${dict_copy}    ${key_data}    ${value_data}
    [Return]    ${dict_copy}

Scroll To The Bottom Of The Page
    [Documentation]    Execute scrolling to the bottom of the current page.
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
