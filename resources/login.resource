*** Settings ***
Resource    ./common.resource
Resource   ${LOCATOR_DIR}/authen_locator.resource

*** Keywords ***
Open Login Page
    Open Page Browser    ${LOGIN_PAGE}

Go To Login Page
    Go To    ${LOGIN_PAGE}

Input Login Form
    [Arguments]    ${user}
    Input Text    ${EMAIL_INPUT}        ${user["email"]}
    Input Text    ${PASSWORD_INPUT}     ${user["password"]}

Submit Login
    Click Button  ${LOGIN_BUTTON}

