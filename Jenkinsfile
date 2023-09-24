pipeline {
  agent {
    docker {
      image 'cypress-allure'
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