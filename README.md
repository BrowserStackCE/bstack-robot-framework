# bs-robot-framework

![BrowserStack Logo](https://d98b8t1nnulk5.cloudfront.net/production/images/layout/logo-header.png?1469004780) 

## Setup
* Clone the repo
* Install dependencies  `pip install robotframework`  &&  `pip install --upgrade robotframework-seleniumlibrary`
* `pip install robotframework-pabot` -> This is for parallelization 
* For Appium, `pip install robotframework-appiumlibrary` .For more information refer https://github.com/serhatbolsu/robotframework-appiumlibrary
* **Note: This is w.r.t Python3**

## Set BrowserStack Credentials 
* You can export the environment variables for the Username and Access Key of your BrowserStack account. 

  ```
  export BROWSERSTACK_USERNAME=<browserstack-username> &&
  export BROWSERSTACK_ACCESS_KEY=<browserstack-access-key>
  ```

## Running tests

### Automate
* Navigate to `cd web/test`
* To run single test, run `robot SingleTest.robot`
* To run local tests
  - Start the `BrowserStack Local Binary` in advance. https://www.browserstack.com/local-testing/automate
  - Run `robot LocalTest.robot`
* To run parallel tests, navigate to 'parallel' folder, run `cd parallel`
  1. Test Suite level
    - Run `pabot --processes <count_of_parallels> *.robot`
    - Alternate method: `pabot --processes <count_of_parallels> <name_of_suites_to_run>` Eg: `pabot --processes 2 Suite1.robot       Suite2.robot`
  2. Test case level
    - Run `pabot --testlevelsplit <file_name>` Eg:  `pabot --testlevelsplit Suite1.robot`
  3. Run Test cases and Test suites together in parallel
    - Run `pabot --testlevelsplit --processes <count_of_parallels> *.robot`
    - **Note: If the process count exceeds the parallel thread limit, it will automatically get queued. No changes required in the scripts.**
    
### App Automate

* Navigate to `cd app/test`
* Upload app: https://www.browserstack.com/app-automate/appium-python#getting-started
* Add "app_url" to the script. Eg: 
- Android
```
Open Application    ${REMOTE_URL}    app=bs://<app_url>    name=single_test    build=RobotFramework    platformName=Android    os_version=7.0    device=Samsung Galaxy S8
```
- iOS
```
Open Application    ${REMOTE_URL}    app=bs://<app_url>    name=single_test    build=RobotFramework    platformName=iOS    os_version=11.0    device=iPhone 8 Plus
```

* To run single test, run `robot Appium_android.robot` OR  run `robot Appium_ios.robot` 
* Parallel Execution: Same process as Automate

  
## Mobile Browsers (Automate)
* Android: Replace `browser` (i.e. &{DC}[browser]) parameter in `Open Browser` to `android`
* iOS: Replace `browser` (i.e. &{DC}[browser]) parameter in `Open Browser` to `iphone`


 Understand how many parallel sessions you need by using our [Parallel Test Calculator](https://www.browserstack.com/automate/parallel-calculator?ref=github)

## Notes
* You can view your test results on the [BrowserStack Automate dashboard](https://www.browserstack.com/automate)
* To test on a different set of browsers, check out our [platform configurator](https://www.browserstack.com/automate/java#setting-os-and-browser)

## Addtional Resources
* [Documentation for writing Automate test scripts in Java](https://www.browserstack.com/automate/java)
* [Customizing your tests on BrowserStack](https://www.browserstack.com/automate/capabilities)
* [Browsers & mobile devices for selenium testing on BrowserStack](https://www.browserstack.com/list-of-browsers-and-platforms?product=automate)
* [Using REST API to access information about your tests via the command-line interface](https://www.browserstack.com/automate/rest-api)
