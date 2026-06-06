*** Settings ***
Resource    ../resources/login.resource
Resource    ../resources/home.resource
Resource    ../resources/cart.resource

Test Setup      Open Login Page
Test Teardown   Close All Browsers

*** Variables ***
${json_file}    ${CURDIR}/../testdata/checkout.json
${product_key}    products
${address_key}    billing_address


*** Test Cases ***    
Add Product To Cart Successfully (${BROWSER})
    ${user}=    Create Dictionary    email=${EMAIL}    password=${PASSWORD}
    ${products}=    Read Json    ${json_file}    ${product_key}
    ${billing_address}=    Read Json    ${json_file}    ${address_key}

    Input Login Form    ${user}
    Submit Login
    Verify Login Success
    Add List Of Products To Cart    ${products}
    Go To Cart Page
    Verify List Of Products Added To Cart    ${products}
    Tick Terms And Conditions
    Click On Checkout Button
    Enter Billing Address Information Or Continue     ${billing_address}
    Select Shipping Method Option    ${billing_address["shipping_method"]}
    Click On Continue on Shipping Method Segment
    Select Payment Method Option    ${billing_address["payment_method"]}
    Click On Continue on Payment Method Segment
    Click On Continue on Payment Information Segment
    Click On Confirm Button
    Verify Order Successfully
    Capture Page Screenshot    order-success.png
    
















     


    


