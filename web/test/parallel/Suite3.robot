*** Settings ***
Library    SeleniumLibrary    
*** Variables ***
${USERNAME}    %{BROWSERSTACK_USERNAME}    #Can specify BrowserStack Username directly instead of Environment variable.
${ACCESS_KEY}    %{BROWSERSTACK_ACCESS_KEY}    #Can specify BrowserStack Accesskey directly instead of Environment variable.
${REMOTE_URL}    http://${USERNAME}:${ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub
${URL}    https://www.google.com
&{DC}    os=Windows    os_version=10    browser=Chrome    browser_version=78.0    build=RobotFramework    name=parallel_test

*** Test Cases ***
Parallel Tests
    Open Browser    ${URL}    &{DC}[browser]    remote_url=${REMOTE_URL}    desired_capabilities=&{DC}
    Input Text    name=q    BrowserStack 
    Press Keys    name=q    ENTER
    Sleep    5           
    Close Browser