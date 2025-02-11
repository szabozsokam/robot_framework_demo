*** Settings ***
Documentation   List of web elements and functions on python exercises page
Library     SeleniumLibrary
Resource    common_keywords.robot


*** Variables ***
${EX_ADD_ITEMS}    id=xr_dictionaries_add
${ANSWER_ADD}    xpath=//code[text()="add()"]
${ANSWER_UPDATE}    xpath=//code[text()="update()"]
${SUBMIT_BTN}    xpath=//button[text()[contains(., "Submit Answer")]]
${QUESTION}    id=qobj_question
${FEEDBACK_NOT_CORRECT}    xpath=//h2[normalize-space(text())="Wrong Answer!"]
${TRY_AGAIN_BTN}    xpath=//button[text()="Try Again"]
${FEEDBACK_CORRECT}    xpath=//h2[normalize-space(text())="Correct Answer!"]
${NEXT_BTN}   xpath=//button[@onclick="goto_next_question()"]
${SHOW_ANSWER_BTN}    xpath=//button[text()[contains(., "Show Answer")]]
${IF_SHOWING_ANSWER}    xpath=//pre[@id="showcorrectanswercontainer"]/input[3]
${HIDE_ANSWER_BTN}    xpath=//button[text()[contains(., "Hide Answer")]]


*** Keywords ***
Solve Exercises
    [Documentation]    Checks exercise functions
    Give Bad Answer To Question
    Give Good Answer To Question
    Show And Hide Answer

Give Bad Answer To Question
    [Documentation]    Solves Question 1 good and checks positive feedback
    Page Should Contain    Test Yourself With Exercises
    Click Element    ${EX_ADD_ITEMS}
    ${window_handles}=    Get Window Handles
    Switch Window    ${window_handles}[1]
    Wait Until Element Is Visible    ${QUESTION}
    Click Element    ${ANSWER_ADD}
    Click Element    ${SUBMIT_BTN}
    Element Should Be Visible    ${FEEDBACK_NOT_CORRECT}
    Click Element    ${TRY_AGAIN_BTN}

Give Good Answer To Question
   [Documentation]    Solves Question 2 bad and checks negative feedback
    Wait Until Element Is Visible    ${QUESTION}
    Click Element    ${ANSWER_UPDATE}
    Click Element    ${SUBMIT_BTN}
    Element Should Be Visible    ${FEEDBACK_CORRECT}
    Click Element    ${NEXT_BTN}

Show And Hide Answer
   [Documentation]     Show and hide answer for questions
   Wait Until Element Is Visible    ${SHOW_ANSWER_BTN}
   Click Element    ${SHOW_ANSWER_BTN}
   ${shown_answer}=    Get Value    ${IF_SHOWING_ANSWER}
   Should Be Equal    ${shown_answer}    "red"
   Wait Until Element Is Visible   ${HIDE_ANSWER_BTN}
   Click Element    ${HIDE_ANSWER_BTN}
   Close And Switch Window
   Element Should Be Visible    ${EX_ADD_ITEMS}