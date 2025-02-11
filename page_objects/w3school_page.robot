*** Settings ***
Documentation   Elements and functions for w3school python tutorial page
Library    SeleniumLibrary
Resource    common_keywords.robot
Resource    exercises_page.robot


*** Variables ***
${ACCEPT_COOKIES_BTN}    id=accept-choices

${MENU_DICT}    xpath=//a[@href="python_dictionaries.asp"]
${MENU_DICT_METHODS}    xpath=//a[@href="python_dictionaries_methods.asp"]

${METHOD_TABLE}    xpath=//table[@class="ws-table-all notranslate"]
${METHOD_KEYS_DISCRIPTION}    xpath=//a[normalize-space(text())="keys()"]/../following-sibling::td
${NEXT_EX_BTN}    xpath=//a[normalize-space(text())="Next ❯"][1]


*** Keywords ***
Browse In Dictionary Chapter
    [Documentation]    Browsing in Python Dictionaries Chapter
    Navigate To Dictionary Methods
    Check Dictionary Methods Table

# helper keywords for better readability of the main keywords:

Navigate To Dictionary Methods
    [Documentation]   Navigates to Dictionary Methods Subchapter
    Wait Until Element Is Visible    ${ACCEPT_COOKIES_BTN}
    Click Element    ${ACCEPT_COOKIES_BTN}
    Switch Window    MAIN
    Wait Until Element Is Enabled    ${MENU_DICT}
    Click Element    ${MENU_DICT}
    Wait Until Element Is Visible    ${MENU_DICT_METHODS}
    Click Element    ${MENU_DICT_METHODS}

Check Dictionary Methods Table
    [Documentation]    Checks the content of the dictionary methods table
    Location Should Be    https://www.w3schools.com/python/python_dictionaries_methods.asp
    Element Should Contain    ${METHOD_KEYS_DISCRIPTION}     Returns a list containing the dictionary's keys
    ${method_get_description}    Get Table Cell    ${METHOD_TABLE}    5    2
    Should Be Equal As Strings    ${method_get_description}    Returns the value of the specified key
    Click Element    ${NEXT_EX_BTN}
    

