*** Settings ***
Resource    ../../Common/init.resource
Resource    table_locators.robot
Suite Setup    Open Browser And Go To Login Page  ${URL_TABLE}
Test Teardown  Close Browser

*** Test Cases ***
TC_VALIDATE_TABLE_001: Verify Data On Table
    [Tags]  table_001
    ${row}=    Get ELement Count    ${BOOK_TABLE}
    Verify Book Table At Row    1    Learn Selenium    Amit    Selenium    300
    Verify Header Of Book Table    0  ${HEADER_TABLE}
    Verify Recurring Fee Table At Row  1  ${ROW_BOOK_01}
    Verify Recurring Fee Table At Row  2  ${ROW_BOOK_02}
    Verify Recurring Fee Table At Row  3  ${ROW_BOOK_03}
    Verify Recurring Fee Table At Row  4  ${ROW_BOOK_04}
    Verify Recurring Fee Table At Row  5  ${ROW_BOOK_05}
    Verify Recurring Fee Table At Row  6  ${ROW_BOOK_06}

*** Keywords ***
Verify Book Table At Row
    [Arguments]  ${row}  ${book_name}  ${author}  ${subject}  ${price}
    ${row}=    Evaluate    ${row} + 1
    Wait Until Element Is Visible  ${BOOK_TABLE}
    Scroll To Element  ${BOOK_TABLE}
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${row}  1  ${book_name}
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${row}  2  ${author}
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${row}  3  ${subject}
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${row}  4  ${price}

Verify Header Of Book Table
    [Arguments]  ${row}  ${contents}
    ${value}=    Evaluate    ${row} + 1
    ${temp}=    Get From List  ${contents}  0
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${value}  1  ${temp}
    ${temp}=    Get From List  ${contents}  1
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${value}  2  ${temp}
    ${temp}=    Get From List  ${contents}  2
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${value}  3  ${temp}
    ${temp}=    Get From List  ${contents}  3
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${value}  4  ${temp}

Verify Recurring Fee Table At Row
    [Arguments]  ${row}  ${contents}
    ${value}=    Evaluate    ${row} + 1
    ${temp}=    Get From List  ${contents}  0
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${value}  1  ${temp}
    ${temp}=    Get From List  ${contents}  1
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${value}  2  ${temp}
    ${temp}=    Get From List  ${contents}  2
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${value}  3  ${temp}
    ${temp}=    Get From List  ${contents}  3
    Run Keyword And Continue On Failure  Table Cell Should Contain  ${BOOK_TABLE}  ${value}  4  ${temp}
