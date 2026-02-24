pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/karthi210/car.git', branch: 'master'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t car-website .'
            }
        }

        stage('Stop previous container') {
            steps {
                sh '''
                docker ps -q --filter "publish=80" | xargs -r docker rm -f
                '''
            }
        }

        stage('Run Docker') {
            steps {
                sh 'docker run -d -p 80:80 car-website'
            }
        }
    }
}
