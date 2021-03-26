*** Settings ***
 
Resource    ../../OpenEMR/Resource/Base/common_functionality.robot 
Documentation    This file tests for valid credentials


*** Test Cases ***
InValid_Credential_Test
    Launch Browser
    
    Input Text    xpath=//input[@id='authUser']    ppp   
    Input Password    id=clearPass    pass   
    Select From List By Label    name=languageChoice    English (Indian)   
    Click Element    xpath=//button[@type='submit']  
    Element Should Contain    xpath=//div[contains(text(),'Invalid')]    Invalid username or password 

    End Browser