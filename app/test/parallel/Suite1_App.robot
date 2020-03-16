*** Settings ***
Library    AppiumLibrary

*** Variables ***
${USERNAME}    %{BROWSERSTACK_USERNAME}    #Can specify BrowserStack Username directly instead of Environment variable.
${ACCESS_KEY}    %{BROWSERSTACK_ACCESS_KEY}    #Can specify BrowserStack Accesskey directly instead of Environment variable.
${REMOTE_URL}    http://${USERNAME}:${ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub
${URL}    https://www.google.com

*** Test Cases ***
Appium Test on BrowserStack
    Open Application    ${REMOTE_URL}    app=%{BROWSERSTACK_APP_ID}    name=parallel_test	build=RobotFramework    platformName=Android    os_version=9.0    device=OnePlus 7
	# accessibility id=Alert Button
	Click Element    id=Alert Button
	# accessibility id=OK
	Click Element    id=OK
	Close Application

