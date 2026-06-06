*** Settings ***
Resource    ../config/library.resource
Resource    ../config/endpoint.resource

*** Keywords ***
Open Page Browser
    [Arguments]    ${URL}
    Open Browser    ${URL}    ${BROWSER} 


 



