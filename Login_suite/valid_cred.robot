*** Settings ***

Resource    ../../OpenEMR/Resource/Base/common_functionality.robot    
Documentation    This file tests for valid credentials

Test Setup    Launch Browser
Test Teardown    End Browser

*** Test Cases ***
Valid_Credential_Test
    
    Input Text    xpath=//input[@id='authUser']    admin   
    Input Password    id=clearPass    pass   
    Select From List By Label    name=languageChoice    English (Indian)   
    Click Element    xpath=//button[@type='submit']  
    Wait Until Page Contains Element    xpath=//span[@data-bind='text:fname']    timeout=30s
    Page Should Contain    Flow Board
    Mouse Over    //span[@data-bind='text:fname']
    Click Element    xpath=//li[text()='Logout']
    Wait Until Page Contains Element    xpath=//input[@id='authUser']        timeout=30s
    Title Should Be    OpenEMR Login   
    
Invalid_Credential_Test
    
    Input Text    xpath=//input[@id='authUser']    ppp   
    Input Password    id=clearPass    pass   
    Select From List By Label    name=languageChoice    English (Indian)   
    Click Element    xpath=//button[@type='submit']  
    Element Should Contain    xpath=//div[contains(text(),'Invalid')]    Invalid username or password 
    
