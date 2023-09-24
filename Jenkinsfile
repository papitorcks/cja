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
      }
    }
  }
  post {
    always {
      allure includeProperties: false, jdk: '', results: [
        [path: 'allure-results']
      ]
    }
  }
}