*** Settings ***
Documentation    This file takes for browser activities
Library    DateTime    
Library    SeleniumLibrary    screenshot_root_directory=screenshot/ 
Library    OperatingSystem  
 
*** Keywords ***
Launch Browser
    Append To Environment Variable    PATH    ${EXECDIR}\\driver   
    Open Browser    url=https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    browser=chrome
    Maximize Browser Window  
    Set Selenium Implicit Wait    30s
    
End Browser
    Capture Page Screenshot    
    Close Browser
    