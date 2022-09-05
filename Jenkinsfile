node {
   def mvnHome
   stage('Preparation') { // for display purposes
   //pass login
 properties([parameters([credentials(credentialType: 'com.browserstack.automate.ci.jenkins.BrowserStackCredentials', defaultValue: '', description: '', name: 'BROWSERSTACK_USERNAME', required: true), choice(choices: ['single', 'local', 'parallel - testsuite level', 'parallel - testcase level', 'appium_android', 'appium_ios', 'appium parallel'], description: 'Included Automate and App-Automate tests', name: 'Command')])])
    git changelog: false, poll: false, url: 'https://github.com/BrowserStackCE/bstack-robot-framework.git'
   }
   stage('Initiate tests on BrowserStack') {
        browserstack(credentialsId: "${params.BROWSERSTACK_USERNAME}",localConfig: [localOptions: '', localPath: '']) {
            def user = "${env.BROWSERSTACK_USERNAME}"
            def browser = "${params.browser}"
            if ( user.contains('-')) {
                user = user.substring(0, user.lastIndexOf("-"))
            }
            withEnv(['BROWSERSTACK_USERNAME=' + user]) {
                if("${params.Command}" == 'single'){
                    sh label: '', returnStatus: true, script: '''#!/bin/bash -l
                                /var/lib/jenkins/.local/bin/robot web/test/SingleTest.robot
                               '''
                }
                if("${params.Command}" == 'local'){
                    sh label: '', returnStatus: true, script: '''#!/bin/bash -l
                                /var/lib/jenkins/.local/bin/robot web/test/LocalTest.robot
                                #robot LocalTest.robot
                               '''
                }
                if("${params.Command}" == 'parallel - testsuite level'){
                    sh 'echo ${WORKSPACE}'
        
                    sh label: '', returnStatus: true, script: '''#!/bin/bash -l
                                export PATH=~/.local/bin:$PATH
                                /var/lib/jenkins/.local/bin/pabot --verbose --processes 3 web/test/parallel/*.robot
                               '''
                }
                if("${params.Command}" == 'parallel - testcase level'){
                    sh label: '', returnStatus: true, script: '''#!/bin/bash -l
                                export PATH=~/.local/bin:$PATH
                                /var/lib/jenkins/.local/bin/pabot --testlevelsplit --processes 5 web/test/parallel/*.robot
                               '''
                }
                if("${params.Command}" == 'appium_android'){
                    def app_path = "${WORKSPACE}/app/test"
                   
                    browserstackAppUploader(app_path + '/WikipediaSample.apk') {
                        
                    sh label: '', returnStatus: true, script: '''#!/bin/bash -l
                                /var/lib/jenkins/.local/bin/robot --console verbose app/test/Appium_android.robot
                               '''
                    }
                }
                
                if("${params.Command}" == 'appium_ios'){
                    def app_path = "${WORKSPACE}/app/test"
                   
                    browserstackAppUploader(app_path + '/BStackSampleApp.ipa') {
                        
                    sh label: '', returnStatus: true, script: '''#!/bin/bash -l
                                /var/lib/jenkins/.local/bin/robot --console verbose app/test/Appium_ios.robot
                               '''
                    }
                }
                if("${params.Command}" == 'appium parallel'){
                    def app_path = "${WORKSPACE}/app/test"
                    browserstackAppUploader(app_path + '/WikipediaSample.apk') {
                        
                    sh label: '', returnStatus: true, script: '''#!/bin/bash -l
                                export PATH=~/.local/bin:$PATH
                                /var/lib/jenkins/.local/bin/pabot --processes 3 app/test/parallel/*.robot
                               '''
                    }
                }
            }
        }
    }
}
