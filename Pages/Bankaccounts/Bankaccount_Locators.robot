*** Variables ***
${CONTAIN_BANKACCOUNT}        //h2[contains(text(),'Bank Accounts')]
${BUTTON_CREATE}              //a[@data-test='bankaccount-new']
${UL_ITEM}                    //li[@class='MuiListItem-root MuiListItem-gutters']
${BANK_NAME_VRF}              //div[@class='MuiGrid-root MuiGrid-item']/p[contains(text(),'${BANK_ACCOUNT_01.BANK_NAME}')]
${BANKNAME_ERROR_MSG}         //p[@id='bankaccount-bankName-input-helper-text']
${ROUTING_ERROR_MSG}          //p[@id='bankaccount-routingNumber-input-helper-text']
${ACCOUNT_ERROR_MSG}          //p[@id='bankaccount-accountNumber-input-helper-text']
${CONTENT_ERROR_BANKNAME}     Must contain at least 5 characters
${CONTENT_ERROR_ROUTING}      Enter a valid bank routing number
${EMPTY_ROUTING}              Enter a valid bank routing number
${CONTENT_ERROR_ACCOUNT}      Must contain at least 9 digits
${ERROR_ACCOUNT_DIGITS12}     Must contain no more than 12 digits
${FORM}                       //form[@data-test='bankaccount-form']
#Empty
${CONTENT_ERROR_ROUTING}      Enter a valid bank routing number
${EMPTY_BANKNAME}    Enter a bank name
${EMPTY_ROUTING}    Enter a valid bank routing number
${EMPTY_ACCOUNT}    Enter a valid bank account number
