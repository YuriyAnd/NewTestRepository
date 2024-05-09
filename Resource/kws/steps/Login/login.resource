*** Settings ***
Resource    ../Resource/main.resource


*** Keywords ***
Login to Site
    [Documentation]    This Keyword Logs User into Site
    [Arguments]    ${user}
    Sleep    5
#    Wait For Condition    Element States    ${login['btnLogin']}    contains    visible    enabled

    Click    ${login['menuButton']}
    Click    ${login['menuButton']}
    Click    ${login['btnLogin']}
#    Verify Element Color    ${login['btnLogin']}    rgb(0, 0, 255)

#    Sleep    10
#    Wait For Condition    Element States    ${login['input_username']}    contains    visible    enabled
    Type Text    ${login['input_username']}    ${user}
    Type Text    ${login['input_password']}    ${password}
#    Click If Element Exists
    Sleep    10
    # Verify Text
    Click    ${login['btnSignIn']}
    Verify Element Color    ${login['btnSignIn']}    rgb(0, 0, 0)
