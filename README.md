# FE_Automation

FE Automation

-------------Create venv----------------
Run Commends:
virtualenv venv

Set-ExecutionPolicy Unrestricted -Scope Process

.\venv\Scripts\Activate

-----------Install Requirements on VM--------------
Run Commands:
pip install -r requirements.txt

----------Installs Browsers for Playwrite------------
Run Commands:
rfbrowser init

---------------Executing Tests---------------
Run Command for one test case - Chrome/Edge
robot -i 0001 -v ENV:test -d Result Test_Suite

Run Command for test - Chrome/Edge
pabot --pabotlib --processes 1 -v ENV:test -v browser:chromium -d Result Test_Suite

Run Command for test - FireFox
pabot --pabotlib --processes 1 -v ENV:test -v browser:firefox -d Result Test_Suite
