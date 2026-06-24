pipeline {
    agent any
    
    stages {
        stage('clean work space') {
            steps {
                cleanWs()
            }
        }
        
        stage('checkout') {
            steps {
                git credentialsId: 'first_pipeline', url: 'https://github.com/karthi210/car.git'
            }
        }
        
        stage('clean port') {
            steps {
                sh '''
                docker ps -q --filter 'publish=8001' | xargs -r docker rm -f
                '''
            }
        }
        
        stage('build') {
            steps {
                sh '''
                docker build -t carwebsite .
                '''
            }
        }
        
        stage('run in port') {
            steps {
                sh '''
                docker run -d -p 8001:80 carwebsite
                '''
            }
        }
    }
}
