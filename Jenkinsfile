pipeline {
    agent any
    stages {
        stage('Build and run docker image') {
            steps {
                sh 'sudo docker pull kubemisbah/ica2_dockerrepo:latest'
                sh 'sudo docker run run -d -p 8082:80 kubemisbah/ica2_dockerrepo:latest'
            } 
        }


        stage('testing') {
            steps {
                sh 'curl -I http://192.168.56.3:8082'
            }
        }

    
    }
}
