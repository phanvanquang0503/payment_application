*** Variables ***
${HOME}            //div[@class='MuiListItemText-root']/span[contains(text(),'Home')]
${MY_ACCOUNT}      //div[@class='MuiListItemText-root']/span[contains(text(),'My Account')]
${BANK_ACCOUNT_LCT}    //div[@class='MuiListItemText-root']/span[contains(text(),'Bank Accounts')]
${NOTIFICATION}    //div[@class='MuiListItemText-root']/span[contains(text(),'Notifications')]
${BUTTON_LOGOUT}   //div[@class='MuiListItemText-root']/span[contains(text(),'Logout')]
${BUTTON_NEXT}     //span[contains(text(),'Next')]

#Create Bank Account
${BANKNAME_LCT}              //input[@name='bankName']
${ROUTING_NUMBER_LCT}        //input[@name='routingNumber']
${ACCOUNT_NUMBER_LCT}        //input[@name='accountNumber']
${BUTTON_SAVE}               //button[@data-test='bankaccount-submit']
${BUTTON_DONE}               //button[@data-test='user-onboarding-next']
