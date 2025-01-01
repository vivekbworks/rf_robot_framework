pipeline {  
    agent { label 'windows-slave-machine' }  

    parameters {  
        choice(  
            name: 'ENVIRONMENT',  
            choices: ['uat', 'prod'],  
            description: 'Choose the environment to run tests'  
        )  
        choice(  
            name: 'TAGS',  
            choices: ['Smoke', 'Regression', 'Sanity'],  
            description: 'Select the test tags to execute'  
        )  
    }  

    stages {  
        stage('Checkout Code from Git') {  
            steps {  
                echo "Checking out code for ${params.ENVIRONMENT} environment"  
                git url: 'https://github.com/vivekbworks/rf_robot_framework.git'  
            }  
        }  

        stage('Install Dependencies') {  
            steps {  
                echo "Setting up environment for ${params.ENVIRONMENT}"  
                bat 'python -m venv venv'
                bat 'venv\Scripts\activate.bat'
                bat 'python -m pip install --upgrade pip wheel'   
                bat 'pip install -r App\Config\requirement.txt'
                echo 'Installation completed.'               
            }  
        }  

        stage('Running Testsuite') {  
            steps {  
                script {  
                    def testURL = ''  
                    if (params.ENVIRONMENT == 'uat') {  
                        testURL = 'https://rahulshettyacademy.com/dropdownsPractise/'  
                    } else if (params.ENVIRONMENT == 'prod') {  
                        testURL = 'https://opensource-demo.orangehrmlive.com/web/index.php/auth/login'  
                    }  

                    echo "Running tests on URL: ${testURL}"  
                    dir("${env.WORKSPACE}") {  
                        bat "robot -d results --variable TEST_URL:${testURL} -i ${params.TAGS} tests/"  
                    }  
                }  
            }  
        }  

        stage('Publish Report') {  
            steps {  
                echo "Publishing report for ${params.ENVIRONMENT}"  
                publishHTML(target: [  
                    allowMissing: false,  
                    alwaysLinkToLastBuild: true,  
                    keepAll: true,  
                    reportDir: 'results',  
                    reportFiles: 'report.html',  
                    reportName: 'Robot Framework Report'  
                ])  
            }  
        }  
    }  

    post {  
        always {  
            echo "Archiving artifacts..."  
            archiveArtifacts artifacts: 'results/**/*', fingerprint: true  
        }  
        success {  
            echo 'Pipeline succeeded!'  
            emailext(  
                subject: "Build Successful: ${env.JOB_NAME} #${env.BUILD_NUMBER}",  
                body: """The build succeeded for ${params.ENVIRONMENT} environment.  
                        Check details here: ${env.BUILD_URL}""",  
                to: 'vivek.workprofile@gmail.com'  
            )  
        }  
        failure {  
            echo 'Pipeline failed!'  
            emailext(  
                subject: "Build Failed: ${env.JOB_NAME} #${env.BUILD_NUMBER}",  
                body: """The build failed for ${params.ENVIRONMENT} environment.  
                        Check details here: ${env.BUILD_URL}""",  
                to: 'vivek.workprofile@gmail.com'  
            )  
        }  
    }  
}
