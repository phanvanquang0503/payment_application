*** Variables ***
${AMOUNT_LCT}        //input[@id='amount']
${NOTE_LCT}          //input[@id='transaction-create-description-input']
${NEW_TRANS}         //a[@data-test="nav-top-new-transaction"]
${PAY}               //button[@data-test='transaction-create-submit-payment']
#Transaction
${NEW}           //a[@data-test='nav-top-new-transaction']
${SEARCH}        //input[@name='q']
${SEARCH_USERA}   Katharina_Bernier
${SEARCH_USERB}   phanvanquang0503
${LIST_USER}     //ul[@data-test='users-list']
${USERA}         //li[@data-test="user-list-item-t45AiwidW"]
${USERB}         //li[@data-test="user-list-item-_AjXSijfO"]
${ERROR_AMOUT}    //p[@id='transaction-create-amount-input-helper-text']
${MESSAGE_ERROR_AMOUNT}    Please enter a valid amount
${ERROR_DESC}    //p[@id='transaction-create-description-input-helper-text']
${MESSAGE_ERROR_DESC}    Please enter a note
${MAIN}    //main[@data-test="main"]