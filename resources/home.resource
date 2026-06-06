*** Settings ***
Resource    ./common.resource
Resource   ${LOCATOR_DIR}/home_locator.resource
Resource   ${LOCATOR_DIR}/authen_locator.resource

*** Keywords ***
Open Home Page
    Open Page Browser    ${HOME_PAGE}  

Go To Home Page
    Go To     ${HOME_PAGE}  

Search Product
    [Arguments]    ${product_name}
    Input Text    ${SEARCH_INPUT}    ${product_name}
    Press Keys    ${SEARCH_INPUT}    ENTER

Click On Add To Cart Button 
    Click Button  ${ADD_TO_CART_BUTTON}

Add List Of Products To Cart
    [Arguments]    ${product_list}
    FOR    ${product_name}    IN    @{product_list}
        Search Product    ${product_name["name"]}
        Click On Add To Cart Button
        Go To Home Page
    END

CLick On Logout Link
    Click Link    ${LOGOUT_LINK}

Verify Login Success
    Wait Until Element Is Visible    ${LOGOUT_LINK}

Verify Logout Success
    Wait Until Element Is Visible    ${LOGIN_LINK}



