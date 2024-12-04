*** Settings ***
Documentation    Robot Framework PoC. SeleniumLibrary is used for browser automation.
Library          SeleniumLibrary    plugins=${CURDIR}/../custom/SetupThrottle.py

*** Variables ***
${BROWSER}       Headless Chrome
${HEADLESS}      True
${URL}           https://micro-frontend-solution-dev.nonprod.pip.cnh.com/
${SPEED}         %{TEST_SPEED=speed default}

*** keywords ***
Global Setup
    Open Browser    ${URL}    ${BROWSER}
    Setup Throttle    ${SPEED}

Micro-Frontend Home Page is Open
    Go To    ${URL}
    Title Should Be    Micro-Frontend Solution

Test for Micro-Frontend Home Page
    # Wait For Elements State     css=div.mws-home > h1:first-child   visible
    Wait For Condition    return document.querySelector('#mounted-apps #home')?.textContent === 'home'