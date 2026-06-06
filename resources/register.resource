*** Settings ***
Resource    ./common.resource
Resource   ${LOCATOR_DIR}/authen_locator.resource

*** Variables ***
${success_message}    Your registration completed
${email_exists_message}    The specified email already exists

*** Keywords ***
Open Register Page
    Open Page Browser    ${REGISTER_PAGE}

Go To Register Page
    Go To    ${REGISTER_PAGE}

Input Register Form
    [Arguments]    ${user}
    Input Text    ${FIRSTNAME_INPUT}    ${user["first"]}
    Input Text    ${LASTNAME_INPUT}     ${user["last"]}
    Input Text    ${EMAIL_INPUT}        ${user["email"]}
    Input Text    ${PASSWORD_INPUT}     ${user["password"]}
    Input Text    ${CONFIRM_PASSWORD_INPUT}   ${user["password"]}

Submit Register
    Click Button  ${REGISTER_BUTTON}

Verify Register Success
    Wait Until Page Contains       ${success_message}

Verify Register Email Exists
    Wait Until Page Contains       ${email_exists_message}

Verify Register Error Message With Invalid Input
    [Arguments]    ${error_message}
    Wait Until Page Contains       ${error_message}      


