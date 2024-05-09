*** Settings ***
Documentation       Search Tests

Resource            ../Resource/main.resource

Suite Setup         Start Browser
Suite Teardown      Suite Teardown
Test Setup          Go To Login Page

Force Tags          search


*** Test Cases ***
Search For Test1
    [Tags]    0002
    Login to Rx Photo    ${user}
