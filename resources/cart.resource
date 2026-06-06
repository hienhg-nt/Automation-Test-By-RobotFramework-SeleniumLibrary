*** Settings ***
Resource    ./common.resource
Resource   ${LOCATOR_DIR}/authen_locator.resource
Resource   ${LOCATOR_DIR}/cart_locator.resource

*** Variables ***
${order_success_message}    Your order has been successfully processed!
${shipping_text}    Shipping by land transport
${payment_method_text}    Pay by cheque or money order
${payment_info_text}    Mail Personal or Business Check, Cashier's Check or money order to:

*** Keywords ***
Open Cart Page
    Open Page Browser    ${CART_PAGE}      

Go TO Cart Page
    Go To    ${CART_PAGE}

Tick Terms And Conditions
    Select Checkbox    ${TERM_CONDITION_CHECKBOX}

Click On Checkout Button
    Click Button    ${CHECKOUT_BUTTON}

Enter Billing Address Information
    [Arguments]    ${address}
    Select From List By Label    ${COUNTRY_DROPDOWN}    ${address["country"]}
    Select From List By Label    ${STATE_DROPDOWN}      ${address["state"]}
    Input Text    ${CITY_INPUT}       ${address["city"]}
    Input Text    ${ADDRESS1_INPUT}   ${address["address1"]}
    Input Text    ${ZIP_INPUT}        ${address["zip"]}
    Input Text    ${PHONE_INPUT}      ${address["phone"]}

Click On Continue on Address Segment
    Click Button    ${ADDRESS_CONTINUE_BUTTON}
    Wait Until Page Contains    ${shipping_text} 

Enter Billing Address Information Or Continue
     [Arguments]    ${address}
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${EDIT_ADDRESS_BUTTON}
    IF    ${visible}
        Click On Continue on Address Segment
    ELSE
        Enter Billing Address Information    ${address}
        Click On Continue on Address Segment
    END

Select Shipping Method Option 
    [Arguments]    ${option_value}
    Select Radio Button    ${SHIPPING_METHOD_RADIO}    ${option_value}

Click On Continue on Shipping Method Segment
    Click Button    ${SHIPPING_METHOD_CONTINUE_BUTTON}
    Wait Until Page Contains    ${payment_method_text} 

Select Payment Method Option 
    [Arguments]    ${option_value}
    Select Radio Button    ${PAYMENT_METHOD_RADIO}    ${option_value}

Click On Continue on Payment Method Segment
    Click Button    ${PAYMENT_METHOD_CONTINUE_BUTTON}
    Wait Until Page Contains   ${payment_info_text} 


Click On Continue on Payment Information Segment
    Click Button    ${PAYMENT_INFO_CONTINUE_BUTTON}
    Wait Until Element Is Visible    ${CONFIRM_ORDER_BUTTON}

Click On Confirm Button
    Click Button    ${CONFIRM_ORDER_BUTTON}

Verify List Of Products Added To Cart
    [Arguments]    ${product_list}
    FOR    ${product_name}    IN    @{product_list}
        Wait Until Page Contains       ${product_name["name"]}
    END

Verify Order Successfully
    Wait Until Page Contains       ${order_success_message}    20s





