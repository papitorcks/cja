pipeline {
  agent {
    // this image provides everything needed to run Cypress
    docker {
      image 'cypress/base:18.14.1'
      args '-u root'
    }
  }

  stages {
    stage('build and test') {
      steps {
        sh "yarn install"
        sh "yarn test"
      }
    }
    post {
      always {
        script {
          sh 'npx allure'
          allure([
            includeProperties: false,
            jdk: '',
            properties: [],
            reportBuildPolicy: 'ALWAYS',
            results: [[path: 'allure-results']]
          ])
        }
      }
    }
  }
}