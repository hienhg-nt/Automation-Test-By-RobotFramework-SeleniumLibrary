*** Settings ***
Resource    ../resources/register.resource
Library        DataDriver    file=${data_path}     encoding=UTF-8
Test Setup      Open Register Page
Test Teardown   Close All Browsers
Test Template    Invalid Users Registration

*** Variables ***
${data_path}    ${TESTDATA_DIR}/user.xlsx 

*** Test Cases ***    
Invalid Users Registration Test (${BROWSER})      default    default    default    default    default

*** Keywords ***
Invalid Users Registration
    [Arguments]    ${first}    ${last}    ${email}    ${password}     ${error_message}
    ${user}=    Create Dictionary    first=${first}    last=${last}    email=${email}    password=${password}
    Input Register Form    ${user}
    Submit Register
    Verify Register Error Message With Invalid Input    ${error_message}
    Capture Page Screenshot    invalid-user-${email}-register.png

