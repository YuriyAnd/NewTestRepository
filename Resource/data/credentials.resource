*** Variables ***
${ENV}          test
${user}         yuriytest123
${password}     Addmin1!
${browser}      chromium
${sname}        LN


*** Keywords ***
Define credentials
    IF    "${ENV}" == "test"
        Set Global Variable    ${baseurl}    https://casino.poker-bet1.com/en/
    END
