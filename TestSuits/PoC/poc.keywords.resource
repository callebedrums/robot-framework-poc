*** Settings ***
Documentation    Robot Framework PoC. BrowserLibrary is used for browser automation.
...              BrowserLibrary is preferable over SeleniumLibrary because it pierces through shadow DOM automatically, and is more sutable for testing web components.
Library          Browser

*** Variables ***
${BROWSER}       chromium
${HEADLESS}      True
${URL}           https://micro-frontend-solution-dev.nonprod.pip.cnh.com/

*** keywords ***
Navigate to Micro-Frontend Home Page
    # Open Browser    ${URL}    ${BROWSER}    ${HEADLESS}
    New Page    ${URL}
    Get Title     should be    Micro-Frontend Solution

Test for Micro-Frontend Home Page
    Wait For Elements State     css=div.mws-home > h1:first-child   visible
    Get Text    css=div.mws-home > h1:first-child    should be    Welcome to Micro-Frontend Solution Examples Home App