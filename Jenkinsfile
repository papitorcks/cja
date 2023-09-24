pipeline {
  agent {
    // this image provides everything needed to run Cypress
    docker {
      image 'cypress/base:18.14.1'
    }
  }

  stages {
    stage('build and test') {
      steps {
        sh "yarn install"
        sh "yarn test"
        allure includeProperties: false, jdk: '', results: [[path: 'allure-results']]
      }
    }
  }
}