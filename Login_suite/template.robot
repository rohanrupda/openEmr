*** Settings ***

Resource    ../../OpenEMR/Resource/Base/common_functionality.robot    
Documentation    This file tests for valid credentials

Test Setup    Launch Browser
Test Teardown    End Browser

Library    DataDriver    file=../testdata/OpenEMR.xlsx    sheet_name=Inavlid_Testcase

Test Template    Credential_Template

*** Test Cases ***

Inavlid_Testcase
    

*** Keywords ***
Credential_Template
    [Arguments]    ${user}    ${pass}    ${lang}    ${mesg}  
    
    Input Text    xpath=//input[@id='authUser']    ${user}   
    Input Password    id=clearPass    ${pass}   
    Select From List By Label    name=languageChoice    ${lang}    
    Click Element    xpath=//button[@type='submit']
    #Page Should Contain    ${mesg}   
    Element Should Contain    xpath=//div[contains(text(),'Invalid')]    ${mesg} 
