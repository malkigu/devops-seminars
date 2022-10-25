pipeline {
    agent any

    stages {
        stage('Checkout From SCM') {
            steps {
                echo 'Checkout from SCM..'
                checkout ...
            }
        }
        stage('Pre-build stg') {
            steps {
                echo 'prebuild actions..'
            }
        }
        stage('Build') {
            steps {
              sh 'docker build --target Build'
            }
        }
        stage('Test') {
            steps {
                echo 'docker build --target test'
            }
        }
        stage('security') {
            agent {
                docker { image 'alpine:latest' }
            }
            steps {
                sh 'echo this is security'
            }
        }
        stage('Back-end') {
            agent {
                docker { image 'maven:3.8.1-adoptopenjdk-11' }
            }
            steps {
                sh 'mvn --version'
            }
        }
        stage('Front-end') {
            agent {
                docker { image 'node:16.13.1-alpine' }
            }
            steps {
                sh 'node --version'
            }
        }
        stage('Deploy') {
            agent {
                docker { image 'aws-cli:latest' }
            }
            steps {
                sh 's3 cp src dst'
            }
        }
      stage ('Post') {
        echo "clear env"
      }
      
    }
}
