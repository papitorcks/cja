pipeline {
  agent {
    docker {
      image 'cypress/base:18.14.1'
    }
  }
  stages {
    stage('build and test') {
      steps {
        sh "yarn install"
        sh "yarn test"
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