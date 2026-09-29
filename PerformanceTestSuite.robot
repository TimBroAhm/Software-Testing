*** Settings ***
Library    LocustLibrary
Suite Setup    Setup Locust
Suite Teardown    Stop Locust

*** Test Cases ***
Concurrent Login Load Test
    Run Locust Test    locustfile.py    ${LOGIN_URL}    100    10
    Assert Response Time <    2s
    Assert Error Rate <    1%

Stress Test
    Run Locust Test    locustfile.py    ${LOGIN_URL}    500    50
    Assert Failure Rate <    5%

Endurance Test
    Run Locust Test    locustfile.py    ${LOGIN_URL}    100    10
    Assert Test Duration <    4h
