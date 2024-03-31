*** Settings ***
Documentation   List of web elements and functions on python exercises page
Library     SeleniumLibrary
Resource    common_keywords.robot


*** Variables ***
${EXERCISE_1_IF}    name=ex1
${SUBMIT_BTN}    xpath=//button[text()[contains(., "Submit Answer")]]
${FEEDBACK_CORRECT}    xpath=//h2[normalize-space(text())="Correct!"]
${NEXT_EXERCISE_BTN}    xpath=//button[text()[contains(., "Next Exercise")]]
${EXERCISE_2_IF_1}    xpath=//pre[@id="assignmentcontainer"]/input[1]
${EXERCISE_2_IF_2}    xpath=//pre[@id="assignmentcontainer"]/input[2]
${FEEDBACK_NOT_CORRECT}    xpath=//h2[normalize-space(text())="Not Correct"]
${BACK_LINK}    xpath=//u[text()="here"]
${SHOW_ANSWER_BTN}    xpath=//button[text()[contains(., "Show Answer")]]
${IF_SHOWING_ANSWER}    xpath=//pre[@id="showcorrectanswercontainer"]/input[1]
${HIDE_ANSWER_BTN}    xpath=//button[text()[contains(., "Hide Answer")]]
${shown_answer}    


*** Keywords ***
Solve Exercises
    [Documentation]    Checks exercise functions
    Give Good Answer To Question 1
    Give Bad Answer To Question 2
    Check Answer Buttons

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
   Show Answer And Copy
   # Paste Shown Answer And Submit
   Close And Switch Window

Show Answer And Copy
   [Documentation]     Show and hide answer for questions
   Wait Until Element Is Visible    ${SHOW_ANSWER_BTN}
   Click Element    ${SHOW_ANSWER_BTN}
   Double Click Element    ${IF_SHOWING_ANSWER}
   Open Context Menu    ${IF_SHOWING_ANSWER}
   Sleep    1s    waiting for right click menu
   Press Keys    ${None}    ARROW_DOWN    RETURN 
   # Wait Until Element Is Visible   ${HIDE_ANSWER_BTN}
   # Click Element    ${HIDE_ANSWER_BTN}

Paste Shown Answer And Submit
   [Documentation]    Paste copied answer into input field and submit
   Click Element    ${EXERCISE_2_IF_1}
   Input Text    ${EXERCISE_2_IF_1}    ${shown_answer}
   Input Text    ${EXERCISE_2_IF_2}    2020
   Click Element    ${SUBMIT_BTN}
   Element Should Be Visible    ${FEEDBACK_CORRECT}
