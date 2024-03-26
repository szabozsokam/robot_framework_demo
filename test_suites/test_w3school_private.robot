*** Settings ***
Documentation    Browse Python tutorial on w3school in private mode
Library    SeleniumLibrary    30
Resource    ../page_objects/common_keywords.robot
Resource    ../page_objects/w3school_keywords.robot

Suite Setup    Start W3school Page In Private Mode

*** Tasks ***
Check Dictionary Chapter In Python Tutorial
    [Documentation]    Checks Python Dictionaries Chapter on w3school
    Browse In Dictionary Chapter
    Solve Exercises
