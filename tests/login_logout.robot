*** Settings ***
Resource    ../resources/login.resource
Resource    ../resources/home.resource

Test Setup      Open Login Page
Test Teardown   Close All Browsers

*** Variables ***
${json_file}    ${CURDIR}/../testdata/checkout.json
${product_key}    products
${address_key}    billing_address


*** Test Cases ***    
Login And Logout Successfully (${BROWSER})
    ${user}=    Create Dictionary    email=${EMAIL}    password=${PASSWORD}

    Input Login Form    ${user}
    Submit Login
    Verify Login Success
    Capture Page Screenshot    login-success.png
    CLick On Logout Link
    Verify Logout Success
    Capture Page Screenshot    logout-success.png


















     


    


