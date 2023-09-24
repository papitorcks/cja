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
        sh "npm install"
        sh "npx cypress run"
      }
    }
  }
}