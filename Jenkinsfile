pipeline {
    agent any
    stages {
        stage('Cleanup') {
            steps {
                cleanWs()
            }
        }

        stage('Clone Git Repo') {
            steps {
                checkout scm
            }
        }
        stage('Clone from repository') {
            steps {
                git url: 'https://github.com/moto-0505/2244_ica2.git', branch: 'develop', credentialsId: 'GIT'
            }
        }

        stage('Build and run docker image') {
            steps {
                sh 'sudo docker build -t kubemisbah/ica2_dockerrepo:latest .'
                sh "sudo docker tag kubemisbah/ica2_dockerrepo:latest kubemisbah/ica2_dockerrepo:develop-${env.BUILD_ID}" 
		sh 'sudo docker stop ica-app || true && docker rm ica-app || true'
                sh 'sudo docker run --name ica-app -d -p 8081:80 kubemisbah/ica2_dockerrepo:latest'
                sh 'sudo docker run -d -p 8081:80 kubemisbah/ica2_dockerrepo:latest'
            } 
        }


        stage('Build and Push') {
            steps {
                echo 'Building..'
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-auth', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh '''
                            sudo docker login -u ${USERNAME} -p ${PASSWORD}
                            sudo docker push kubemisbah/ica2_dockerrepo:latest
                        '''
                        sh "sudo docker push kubemisbah/ica2_dockerrepo:develop-${env.BUILD_ID}"
                    }
            }
        }

        stage('testing') {
            steps {
                sh 'curl -I http://192.168.56.3:8081'
            }
        }

    
    }
}
