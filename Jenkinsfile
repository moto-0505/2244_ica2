pipeline {
    agent any
    stages {
        stage('Build and run docker image') {
            steps {
			    sh 'sudo docker pull kubemisbah/ica2_dockerrepo:latest'
				sh 'sudo docker stop ica || true && docker rm ica || true'
                sh 'sudo docker run --name ica -d -p 8082:80 kubemisbah/ica2_dockerrepo:latest'

				
            } 
        }


        stage('testing') {
            steps {
                sh 'curl -I http://192.168.56.3:8082'
            }
        }

    
    }
}
