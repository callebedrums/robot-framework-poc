*** Settings ***
Documentation    Robot Framework PoC. SeleniumLibrary is used for browser automation.
Library          SeleniumLibrary

*** Variables ***
${BROWSER}       Headless Chrome
${HEADLESS}      True
${URL}           https://micro-frontend-solution-dev.nonprod.pip.cnh.com/

*** keywords ***
# Global Setup
#     New Page
#     setupThrottle    ${SPEED}

Micro-Frontend Home Page is Open
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Micro-Frontend Solution

Test for Micro-Frontend Home Page
    # Wait For Elements State     css=div.mws-home > h1:first-child   visible
    Wait For Condition    return document.querySelector('#mounted-apps #home')?.textContent === 'home'