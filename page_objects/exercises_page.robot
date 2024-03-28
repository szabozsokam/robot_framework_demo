*** Settings ***
Documentation   List of web elements and functions on python exercises page
Library     SeleniumLibrary


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
${HIDE_ANSWER_BTN}    xpath=//button[text()[contains(., "Hide Answer")]]


*** Keywords ***
Check Answer Buttons
   [Documentation]     Show and hide answer for questions
   Wait Until Element Is Visible    ${SHOW_ANSWER_BTN}
   Click Element    ${SHOW_ANSWER_BTN}
   Wait Until Element Is Visible    ${HIDE_ANSWER_BTN}
   Click Element    ${HIDE_ANSWER_BTN}
