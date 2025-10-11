pipeline {
  agent any 
           tools{
                maven 'MAVEN' 
       }
        environment {
            DOCKER_HUB_USERNAME = 'ketki123' 
            DOCKER_IMAGE_NAME = 'hostel-managment-app:latest' 
          }
        stages {
            stage('Checkout Source Code') {
                steps {
                  echo "checkout source code ..."
                    checkout scm
                }
            }
            stage('Build Java Application') {
                steps {
                    sh 'mvn clean package' 
                }
            }
            stage('Build Docker Image') {
                steps {
                    sh 'docker build -t hostel-managment-app .'
                    }
                }
            
            stage('Push to Docker Hub') {
                steps {
                    script {
                   sh '''
                docker rm -f  hostel_container || true
                docker run -d --name hostel_container -p 9000:8080 -t hostel-managment-app
                          '''                       
                    }
                }
            }
        }
    }

