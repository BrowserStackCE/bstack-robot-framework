*** Settings ***
Library    SeleniumLibrary      
Library    Collections     
*** Variables ***
${USERNAME}    %{BROWSERSTACK_USERNAME}    #Can specify BrowserStack Username directly instead of Environment variable.
${ACCESS_KEY}    %{BROWSERSTACK_ACCESS_KEY}    #Can specify BrowserStack Accesskey directly instead of Environment variable.
${REMOTE_URL}    http://${USERNAME}:${ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub
${URL}    https://www.google.com
&{DC1}    os=Windows    os_version=10    browser=Firefox    browser_version=latest    build=RobotFramework    name=parallel_test
&{DC2}    os=OS X    os_version=Big Sur    browser=Safari    browser_version=latest-2    build=RobotFramework    name=parallel_test
&{DC3}    device=Samsung Galaxy S22     build=RobotFramework    name=parallel_test
&{DC4}    device=iPhone 13  build=RobotFramework    name=parallel_test

*** Test Cases ***
Parallel Tests 1   
    #Set Test Variable    &{DC1}    os=Windows    os_version=8.1    browser=Chrome    browser_version=75.0    build=RobotFramework    name=parallel_test_1}
    Open Browser    ${URL}  remote_url=${REMOTE_URL}    desired_capabilities=&{DC1}
    Input Text    name=q    BrowserStack 
    Press Keys    name=q    ENTER
    Sleep    5           
    Close Browser
    
*** Test Cases ***
Parallel Tests 2
    #Set Test Variable    &{DC2}    os=Windows    os_version=10    browser=Firefox    browser_version=73.0    build=RobotFramework    name=parallel_test_2}
    Open Browser    ${URL}  remote_url=${REMOTE_URL}    desired_capabilities=&{DC2}
    Input Text    name=q    BrowserStack 
    Press Keys    name=q    ENTER
    Sleep    5           
    Close Browser
    
*** Test Cases ***
Parallel Tests 3
    #Set Test Variable    &{DC3}    os_version=10.0    device=Google Pixel 4 XL    build=RobotFramework    name=parallel_test_3}
    Open Browser    ${URL}    android    remote_url=${REMOTE_URL}    desired_capabilities=&{DC3}
    Input Text    name=q    BrowserStack 
    Press Keys    name=q    ENTER
    Sleep    5           
    Close Browser
    
*** Test Cases ***
Parallel Tests 4
    #Set Test Variable    &{DC4}    os_version=12    device=iPhone 8 Plus    build=RobotFramework    name=parallel_test_4}
    Open Browser    ${URL}    iphone    remote_url=${REMOTE_URL}    desired_capabilities=&{DC4}
    Input Text    name=q    BrowserStack 
    Sleep    5           
    Close Browser
    
# Run command (test suites in parallel): pabot --processes 3   --outputdir c:\pabot-demo\reports\    *.robot
# Run command (for running test cases in parallel): pabot --testlevelsplit --processes 3 *.robot
# Note: if the process count exceeds the parallel thread limit it will automatically get queued no changes need to be done in the scripts
