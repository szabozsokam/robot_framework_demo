*** Settings ***
Documentation   Elements and functions for w3school python tutorial page
Library    SeleniumLibrary
Resource    common_keywords.robot
Resource    exercises_page.robot


*** Variables ***
${ACCEPT_COOKIES_BTN}    id=accept-choices

${MENU_DICT}    xpath=//a[text()[contains(., "Python Dictionaries")]]
${MENU_DICT_METHODS}    xpath=//div[@class="tut_overview overview_body"]/a[text()[contains(.., "Dictionary Methods")]]

${METHOD_TABLE}    xpath=//table[@class="ws-table-all notranslate"]
${METHOD_KEYS_DISCRIPTION}    xpath=//a[normalize-space(text())="keys()"]/../following-sibling::td
${NEXT_BTN}    xpath=//a[normalize-space(text())="Next ❯"][1]


*** Keywords ***
Browse In Dictionary Chapter
    [Documentation]    Browsing in Python Dictionaries Chapter
    Navigate To Dictionary Methods
    Check Dictionary Methods Table

Solve Exercises
    [Documentation]    Checks functionality for exercises
    Give Good Answer To Question 1
    Give Bad Answer To Question 2

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
    Click Element    ${NEXT_BTN}

Give Good Answer To Question 1
    [Documentation]    Solves Question 1 good and checks positive feedback
    Page Should Contain    Test Yourself With Exercises
    Input Text    ${EXERCISE1_IF}    car.get("model")
    Click Element    ${SUBMIT_BTN}
    Switch Window    NEW
    Wait Until Location Is    https://www.w3schools.com/python/exercise.asp?filename=exercise_dictionaries1
    Click Element    ${SUBMIT_BTN}
    Element Should Be Visible    ${FEEDBACK_CORRECT}
    Click Element    ${NEXT_EXERCISE_BTN}

Give Bad Answer To Question 2
    [Documentation]    Solves Question 2 bad and checks negative feedback
    Wait Until Element Is Visible    ${EXERCISE_2_IF_1}
    Input Text    ${EXERCISE_2_IF_1}    car.year
    Input Text    ${EXERCISE_2_IF_2}    2020
    Click Element    ${SUBMIT_BTN}
    Element Should Be Visible    ${FEEDBACK_NOT_CORRECT}
    Click Element    ${BACK_LINK}
    Check Answer Buttons
    Close And Switch Window

