pipeline {
    agent any

    stages {
        stage('Pre-build stg') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target pre-build .'
            }
        }
        stage('build') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target build .'
            }
        }
        stage('test') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target test .'
            }
        }
        stage('security') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target security .'
            }
        }
        stage('backend') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target back-end .'
            }
        }
        stage('front-end') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target front-end .'
            }
        }
        stage('deploy') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target deploy .'
            }
        }
        stage('post') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target post .'
            }
        }
    }
}
