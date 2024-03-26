*** Settings ***
Documentation   General variables and keywords
Library    String
Library    SeleniumLibrary
# Library    RPA.Desktop
Library    ../lib/drivermanager.py

*** Variables ***
${START_URL}    https://www.w3schools.com/python/

*** Keywords ***
Start W3school Page
    [Documentation]     Opens start url in Edge
    ${edgedriver}=    Install Edgedriver
    Open Browser    ${START_URL}    edge    alias=BrowserA
    Maximize Browser Window
    Sleep    1s
#    for slow display mode, activate the following:
#    Set Selenium Speed    1

Start W3school Page In Private Mode
    [Documentation]     Opens start url in Private mode of Edge
    ${edgedriver}=    Install Edgedriver
    Open Browser    ${START_URL}    edge    alias=BrowserA    options=add_argument("--inprivate")
    Maximize Browser Window
    Sleep    1s
#    for slow display mode, activate the following:
#    Set Selenium Speed    1

Close And Switch Window
    [Documentation]     Closes current window and switches back to original window
    ${window_handles}=    Get Window Handles
    Close Window
    Switch Window    ${window_handles}[0]

# Login In Windows Window As User    [Arguments]    &{user}
#     [Documentation]     Fills user data in windows authentication popup
#     RPA.Desktop.Type Text    ${user}[name]
#     RPA.Desktop.Press Keys    tab
#     Sleep    1s
#     RPA.Desktop.Type Text    ${user}[password]
#     RPA.Desktop.Press Keys    enter
#     Sleep    2s


