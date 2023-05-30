pipeline {
    agent any

    tools {
        // Install the maven version configured as "mvn" and add it to the path.
        maven "mvn"
    }

    stages {
        stage('Test') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/MANOHAR452/maven-hello-world.git'
                sh "mvn clean package"
            }
        }
        stage('dockerbuild') {
            steps {
                sh "docker build . -t manohar4524/javahello:${BUILD_NUMBER}"
            }
        }
        stage('dockerpush') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerregistry') {
                        sh "docker push manohar4524/javahello:${BUILD_NUMBER}"
                    }
                }      
            }    
        }    
    }
}
