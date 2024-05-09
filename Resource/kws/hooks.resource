*** Settings ***
Resource    ../Resource/main.resource


*** Keywords ***
Start browser
    New Browser    ${browser}    headless=False
    ${viewport}    Set Variable    {'width': 1280, 'height': 900}
    New Context    viewport=${viewport}
    Grant Permissions    geolocation
    Set Geolocation    40.173708    73.982263
    Set Browser Timeout    40s

Go to login page
    New Page    ${baseurl}
    Check If Element Is Visible    ${login['loginHeader']}

Suite Teardown
    Close Browser
    Log    ------------------------------------------------------------------------------
    ...    level=WARN

Verify Text
    [Arguments]    ${xpath}    ${expected_text}

    ${variable}    Get Text    ${xpath}
    Should Contain    ${variable}    ${expected_text}

Verify Exact Text
    [Arguments]    ${xpath}    ${expected_text}

    ${variable}    Get Text    ${xpath}
    Should Be Equal    ${variable}    ${expected_text}

Verify Text Should Not Contain
    [Arguments]    ${xpath}    ${expected_text}

    ${variable}    Get Text    ${xpath}
    Should Not Contain    ${variable}    ${expected_text}

Check if Element is Enabled
    [Arguments]    ${xpath}

    Get Element States    ${xpath}    contains    enabled

Check if Element is Disabled
    [Arguments]    ${xpath}

    Get Element States    ${xpath}    contains    disabled

Check if Element is Visible
    [Arguments]    ${xpath}

    Get Element States    ${xpath}    validate    visible

Enter Authentication Digit
    [Arguments]    ${xpath}    ${digit}

    ${code}    Set Variable    ${authcode}

    Type Text    ${xpath}    ${code}[${digit}]

Click If Element Exists
    [Arguments]    ${xpath}

    ${element_exists}    Run Keyword and Return Status
    ...    Get Element States    ${xpath}    contains    enabled    attached    visible
    IF    ${element_exists} == True
        Click    ${xpath}
    ELSE
        Log    Element does not exist    level=WARN
    END

Verify Element Count
    [Arguments]    ${xpath}    ${expected_count}

    ${element_count}    Get Element Count    ${xpath}
    Should Be Equal    ${element_count}    ${expected_count}

Verify Element Color
    [Arguments]    ${xpath}    ${expected_color}

    ${color}    Get Style    ${xpath}    key=background-color
    Log    ${color}
    Should Contain    ${color}    ${expected_color}

Check for Duplicate Values in List of Elements
    [Arguments]    ${locator}

    ${element_count}    Get Element Count    ${locator}

    ${elements}    Create List

    FOR    ${index}    IN RANGE    1    ${element_count} + 1
        ${element}    Get Text    xpath=(${locator})[${index}]
        Append To List    ${elements}    ${element}
    END
    List Should Not Contain Duplicates    ${elements}

Log Element Style
    [Arguments]    ${xpath}

    ${style}    Get Style    ${xpath}
    Log    ${style}

Verify Element Fontsize
    [Arguments]    ${xpath}    ${expected_fontsize}

    ${font}    Get Style    ${xpath}    key=font-size
    Log    ${font}
    Should Contain    ${font}    ${expected_fontsize}

Connect To Database
    Connect To Database
    ...    pymysql
    ...    ${OB_db_name}
    ...    ${OB_db_user}
    ...    ${OB_db_password}
    ...    ${OB_db_host}
    ...    ${OB_db_port}
