*** Settings ***
Documentation       Login Tests

Resource            ../Resource/main.resource

Suite Setup         Start Browser
Suite Teardown      Suite Teardown
Test Setup          Go To Login Page

Force Tags          login


*** Test Cases ***
Verify login Test
    [Tags]    0001
    Login to Site    ${user}