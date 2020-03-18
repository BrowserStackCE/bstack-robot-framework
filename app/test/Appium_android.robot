*** Settings ***
Library    AppiumLibrary
Library    Process    

*** Variables ***
${USERNAME}    nithyamani3    #Can specify BrowserStack Username directly instead of Environment variable.
${ACCESS_KEY}    P4JKysg5WuchQxBfKQu1    #Can specify BrowserStack Accesskey directly instead of Environment variable.
${REMOTE_URL}    http://${USERNAME}:${ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub

*** Test Cases ***
Appium Test on BrowserStack
    	Open Application    ${REMOTE_URL}    app=%{BROWSERSTACK_APP_ID}   name=single_test    build=RobotFramework    platformName=Android    os_version=7.0    device=Samsung Galaxy S8
	# id=org.wikipedia.alpha:id/search_container
	Click Element    id=org.wikipedia.alpha:id/search_container
	# id=org.wikipedia.alpha:id/search_src_text
	Click Element    id=org.wikipedia.alpha:id/search_src_text
	Input Text    id=org.wikipedia.alpha:id/search_src_text    BrowserStack
	Click Element    id=org.wikipedia.alpha:id/search_src_text
	# xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout[2]/android.view.ViewGroup/android.support.v4.view.ViewPager/android.view.ViewGroup/android.widget.FrameLayout/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.LinearLayout
	Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout[2]/android.view.ViewGroup/android.support.v4.view.ViewPager/android.view.ViewGroup/android.widget.FrameLayout/android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]/android.widget.LinearLayout
	Close Application
