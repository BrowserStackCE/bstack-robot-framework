*** Settings ***
Library    AppiumLibrary
Library    Process    

*** Variables ***
${USERNAME}    %{BROWSERSTACK_USERNAME}    #Can specify BrowserStack Username directly instead of Environment variable.
${ACCESS_KEY}    %{BROWSERSTACK_ACCESS_KEY}    #Can specify BrowserStack Accesskey directly instead of Environment variable.
${REMOTE_URL}    http://${USERNAME}:${ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub
<<<<<<< HEAD
${APP_PATH}    /Users/nithyamani/Desktop/APPS/BStackSampleApp.ipa

*** Test Cases ***
Appium Test on BrowserStack
   ${AppUrl}    Run Process    curl -u "${USERNAME}:${ACCESS_KEY}" -X POST "https://api-cloud.browserstack.com/app-automate/upload" -F "file\=@${APP_PATH}"    shell=true    alias=AppUpload       
    ${AppData}    Evaluate    json.loads("""${AppUrl.stdout}""")    json
    Log    ${AppUrl.stdout}
    ${hash_id}    Set Variable     ${AppData['app_url']}
    Log    ${hash_id}
    Open Application    ${REMOTE_URL}    app=${hash_id}    name=single_test    build=RobotFramework    platformName=iOS    os_version=11.0    device=iPhone 8 Plus
=======

*** Test Cases ***
Appium Test on BrowserStack
    	Open Application    ${REMOTE_URL}    app=%{BROWSERSTACK_APP_ID}    name=single_test    build=RobotFramework    platformName=iOS    os_version=11.0    device=iPhone 8 Plus
>>>>>>> 29922b3b0100dc49a5aa1601906593a5e23346e5
	# accessibility id=Alert Button
	Click Element    id=Alert Button
	# accessibility id=OK
	Click Element    id=OK
	Close Application

