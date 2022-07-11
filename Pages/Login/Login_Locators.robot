*** Variables ***
${USERNAME_LCT}                //input[@id='username']
${PASSWORD_LCT}                //input[@id='password']
${REMEMBER_LCT}                //input[@name='remember']
${BUTTON_LOGIN}                //button[@data-test='signin-submit']
${SIGNIN_ERROR_MSG}            //div[@class='MuiAlert-message']
${USERNAME_ERROR_MSG}          //p[@id='username-helper-text']
${PASSWORD_ERROR_MSG}          //p[@id='password-helper-text']
${CHECK_REMEMBER}              //input[@name='remember']
${MSG_ERROR_PW}                Password must contain at least 4 characters
${MSG_ERROR_USN}               Username is required