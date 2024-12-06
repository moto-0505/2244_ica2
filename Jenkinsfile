pipeline {
    agent any
    stages {
        stage('Build and run docker image') {
            steps {
						sh 'sudo docker stop ica || true && sudo docker rm ica || true'
						sh 'sudo docker pull kubemisbah/ica2_dockerrepo:latest'
						sh 'sudo docker run --name ica -d -p 8082:80 kubemisbah/ica2_dockerrepo:latest'


            }
        }
		
		
		stage('Deploy container into App server') {
            steps {
                sshagent(['ssh-key']) {
                    // withCredentials([usernamePassword(credentialsId: 'DockerHubPwd', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh '''
                            ssh -tt vagrant@192.168.56.4 -o StrictHostKeyChecking=no  "sudo docker pull kubemisbah/ica2_dockerrepo:latest"
                            ssh -tt vagrant@192.168.56.4 -o StrictHostKeyChecking=no "sudo docker stop ica || true && docker rm ica || true"
                            ssh -tt vagrant@192.168.56.4 -o StrictHostKeyChecking=no "sudo docker run --name ica -d -p 8082:80 kubemisbah/ica2_dockerrepo:latest"
                        '''
                    // }
                }
            }
        }

        stage('testing') {
            steps {
                sh 'curl -I http://192.168.56.4:8082'
            }
        }


    }
}
