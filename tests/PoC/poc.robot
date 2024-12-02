*** Settings ***
Documentation    Robot Framework PoC
...
...              This is a PoC for Robot Framework
Resource         ../resources/poc.keywords.resource
Suite Setup      Global Setup
Default Tags     positive

*** Test Cases ***

Access Micro-Frontend Home Page
    Given Micro-Frontend Home Page is Open
    Then Test for Micro-Frontend Home Page


