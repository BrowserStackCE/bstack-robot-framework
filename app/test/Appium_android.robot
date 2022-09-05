*** Settings ***
Library    AppiumLibrary
Library    Process    

*** Variables ***
${USERNAME}    %{BROWSERSTACK_USERNAME}    #Can specify BrowserStack Username directly instead of Environment variable.
${ACCESS_KEY}    %{BROWSERSTACK_ACCESS_KEY}    #Can specify BrowserStack Accesskey directly instead of Environment variable.
${REMOTE_URL}    http://${USERNAME}:${ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub	

*** Test Cases ***
Appium Test on BrowserStack
   	# id=org.wikipedia.alpha:id/search_container
    Open Application    ${REMOTE_URL}    app=%{BROWSERSTACK_APP_ID}   name=single_test    build=RobotFramework    platformName=Android    os_version=7.0    device=Samsung Galaxy S8
	# id=org.wikipedia.alpha:id/search_container
	Click Element    id=org.wikipedia.alpha:id/search_container
	# id=org.wikipedia.alpha:id/search_src_text
	Click Element    id=org.wikipedia.alpha:id/search_src_text
	Input Text    id=org.wikipedia.alpha:id/search_src_text    BrowserStack
	# id=org.wikipedia.alpha:id/fragment_feed_header
	Click Element    id=org.wikipedia.alpha:id/fragment_feed_header
	Close Application
	
	
	# Upload app programatically
    # ${AppUrl}    Run Process    curl -u "${USERNAME}:${ACCESS_KEY}" -X POST "https://api-cloud.browserstack.com/app-automate/upload" -F "file\=@${APP_PATH}"    shell=true    alias=AppUpload       
    # ${AppData}    Evaluate    json.loads("""${AppUrl.stdout}""")    json
    # Log    ${AppUrl.stdout}
    # ${hash_id}    Set Variable     ${AppData['app_url']}
    # Log    ${hash_id}
