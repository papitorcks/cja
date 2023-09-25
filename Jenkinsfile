pipeline {
  agent any
  stages {
    stage('build and test') {
      docker {
        image 'cypress-allure'
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