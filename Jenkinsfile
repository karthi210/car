pipeline {
    agent any
    
    stages {
        stage('clean work space') {
            steps {
                cleanWs()
            }
        }

        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'docker-01', url: 'https://github.com/karthi210/docker-jenkins.git'
            }
        }

        stage('Deploy to Nginx') {
            steps {
                sh '''
                sudo rm -rf /var/www/html/*
                sudo cp -r * /var/www/html/
                '''
            }
        }

        stage('Verify') {
            steps {
                sh 'ls -la /var/www/html/'
            }
        }
    }
}
