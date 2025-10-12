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
                  script{ 
                        withDockerRegistry(credentialsId:'docker', toolname:'docker'){
                    sh '''
                    docker build -t hostel-managment-app .
                    docker tag hostel-managment-app ketki123/hostel-managment-app:latest
                    docker push ketki123/hostel-managment-app:latest
                    '''                      
                        }
                    }
                }
            }
            stage('Push to Docker Hub') {
                steps {
                    script {
                   sh '''
                docker rm -f  hostel_container || true
                docker run -d --name hostel_container -p 9000:8080 -t hostel-managment-app:latest
                          '''                       
                    }
                }
            }
        }
    }

