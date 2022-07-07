*** Settings ***
Documentation     This file contains all relevant keywords for taking Screenshot section
Library           String
Library           ExtendedSeleniumLibrary
Variables         Settings.yaml

*** Variables ***
${SCR_NUM}        0

*** Keywords ***
Take Page Screenshot
    [Documentation]    Take Screenshot if ${SCR} variable is True
    ${scr_upper} =    Convert To Uppercase    ${SCR}
    ${filename} =    Run Keyword If    "${scr_upper}" == "TRUE"    Get Screenshot File Name With Corresponding Number
    Run Keyword If    "${filename}" is not "${None}"    Capture Page Screenshot    ${filename}.png
    Run Keyword If    "${scr_upper}" == "FALSE"    Log    If you want to take screenshot for test cases, please set SCR variable to True/TRUE

Get Screenshot File Name With Corresponding Number
    [Documentation]    This keyword is used to get the image name with format as: <SuiteName>_<TestName>_SS<Number>.png
    ...    Number is automatically incremented started from 1 when run a different testcase.
    ${suite_name}=    Get Suite Name
    ${SCR_NUM}=    Evaluate    ${SCR_NUM} + 1
    Set Test Variable    ${SCR_NUM}
    ${filename} =    Catenate    SEPARATOR=_    ${suite_name}    ${TEST NAME}    SS${SCR_NUM}
    [Return]    ${filename}

Get Suite Name
    [Documentation]    Returns Suite name from original Suite path
    ${suite_name}=    Fetch From Right    ${SUITE NAME}    .
    ${suite_name}=    Replace String    ${suite_name}    ${SPACE}Testcases    ${EMPTY}
    [Return]    ${suite_name}

Capture Screenshot On Failure
    [Documentation]    This keyword is used to take screenshot for failed test cases.
    ...    If ${SCR} is not TRUE or not exist then this function will be enabled automatically after the test case failed.
    ...    If suite environment run failed, screenshot name has format as: <SuiteName>_Test Setup_Failure.png
    ...    If test case run failed, screenshot name has format as: <SuiteName>_<TestName>_Failure.png
    ${suite_name}=    Get Suite Name
    ${status}=    Run Keyword And Return Status    Variable Should Exist    ${TEST NAME}
    Run Keyword If    '${status}' == 'True'    Do Capture Screenshot    ${suite_name}    ${TEST NAME}    Failure
    ...    ELSE    Do Capture Screenshot    ${suite_name}    Test Setup    Failure

Do Capture Screenshot
    [Arguments]    ${suitename}    ${testcase}    ${result}
    ${filename}=    Catenate    SEPARATOR=_    ${suitename}    ${testcase}    ${result}
    Capture Page Screenshot    ${filename}.png
