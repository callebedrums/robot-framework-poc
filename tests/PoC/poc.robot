*** Settings ***
Documentation    Robot Framework PoC
...
...              This is a PoC for Robot Framework
Resource         ../resources/poc.keywords.resource
Default Tags     positive

*** Test Cases ***

Access Micro-Frontend Home Page
    Navigate to Micro-Frontend Home Page
    Test for Micro-Frontend Home Page


