*** Settings ***
Library           ExtendedSeleniumLibrary
Library           Collections
Library           String
Library           DateTime
Library           OperatingSystem
Library           BuiltIn

Resource    ${EXECDIR}/Common/Common_Keywords.robot
Variables   ${EXECDIR}/Common/Settings.yaml
Variables   ${EXECDIR}/Pages/Home/home_data.yaml
Variables   ${EXECDIR}/Pages/Register/register_data.yaml
Variables   ${EXECDIR}/Pages/Bankaccounts/bankaccount_data.yaml
Variables   ${EXECDIR}/Pages/Transactions/transaction_data.yaml

#Home
Resource    ${EXECDIR}/Pages/Home/Home_Actions.robot
Resource    ${EXECDIR}/Pages/Home/Home_Locators.robot
Resource    ${EXECDIR}/Pages/Home/Home_Page.robot
#login
Resource    ${EXECDIR}/Pages/Login/Login_Actions.robot
Resource    ${EXECDIR}/Pages/Login/Login_Locators.robot
Resource    ${EXECDIR}/Pages/Login/Login_Page.robot
#register
Resource    ${EXECDIR}/Pages/Register/Register_Actions.robot
Resource    ${EXECDIR}/Pages/Register/Register_Locators.robot
Resource    ${EXECDIR}/Pages/Register/Register_Page.robot
#bankaccount
Resource    ${EXECDIR}/Pages/Bankaccounts/Bankaccount_Actions.robot
Resource    ${EXECDIR}/Pages/Bankaccounts/Bankaccount_Locators.robot
Resource    ${EXECDIR}/Pages/Bankaccounts/Bankaccount_Page.robot
#transaction
Resource    ${EXECDIR}/Pages/Transactions/Transaction_Actions.robot
Resource    ${EXECDIR}/Pages/Transactions/Transaction_Locators.robot
Resource    ${EXECDIR}/Pages/Transactions/Transaction_Page.robot