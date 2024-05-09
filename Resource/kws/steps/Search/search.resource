*** Settings ***
Resource    ../Resource/main.resource


*** Keywords ***
Search Test1
    [Arguments]    ${ln}
    Type Text    ${search['search_bar']}    ${ln}
    Wait For Condition    Element States    ${search['user_card']}    contains    visible    enabled
    Click    ${search['user_card']}
