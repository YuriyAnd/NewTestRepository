*** Settings ***
Library     Browser
...             enable_presenter_mode=False
Library     String
Library     pabot.PabotLib
Library     Collections
Library     DatabaseLibrary
Library     pymysql
# CREDS/HOOKS
Resource    ./kws/hooks.resource
Resource    ./data/credentials.resource
# RESOURCE
Resource    ./pages/Login/pg_login.resource
Resource    ./kws/steps/Login/login.resource
Resource    ./pages/Search/pg_search.resource
Resource    ./kws/steps/Search/search.resource
