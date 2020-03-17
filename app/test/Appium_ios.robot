*** Settings ***
Library    AppiumLibrary
Library    Process    

*** Variables ***
${USERNAME}    %{BROWSERSTACK_USERNAME}    #Can specify BrowserStack Username directly instead of Environment variable.
${ACCESS_KEY}    %{BROWSERSTACK_ACCESS_KEY}    #Can specify BrowserStack Accesskey directly instead of Environment variable.
${REMOTE_URL}    http://${USERNAME}:${ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub

*** Test Cases ***
Appium Test on BrowserStack
    	Open Application    ${REMOTE_URL}    app=%{BROWSERSTACK_APP_ID}    name=single_test    build=RobotFramework    platformName=iOS    os_version=11.0    device=iPhone 8 Plus
	# accessibility id=Alert Button
	Click Element    id=Alert Button
	# accessibility id=OK
	Click Element    id=OK
	Close Application

