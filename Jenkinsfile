pipeline {
  agent any
  stages {
    stage('build and test') {
      agent {
        docker {
          image 'cypress/base:18.14.1'
        }
      }
      steps {
        sh "yarn install"
        sh "yarn test"
        input message: 'Partiu?', ok: 'Bora'
      }
    }
  }
  post {
    always {
      allure includeProperties: false, jdk: 'jdk1.8', results: [
        [path: 'allure-results']
      ]
    }
  }
}