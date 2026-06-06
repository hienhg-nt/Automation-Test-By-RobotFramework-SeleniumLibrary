
*** Settings ***
Resource    ../resources/register.resource
Test Setup      Open Register Page
Test Teardown    Close All Browsers

*** Test Cases ***
Register New User Successfully (${BROWSER})
    ${user}=   Generate User
    Input Register Form    ${user}
    Submit Register
    Verify Register Success
    Capture Page Screenshot    register-success.png

Register New User With Existing Email (${BROWSER})
    ${user}=   Generate User
    Input Register Form    ${user}
    Submit Register
    Verify Register Success

    Go To Register Page
    Input Register Form    ${user}
    Submit Register
    Verify Register Email Exists
    Capture Page Screenshot    existing-user-register.png


