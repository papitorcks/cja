pipeline {
  agent {
    docker {
      image 'cypress-base-jdk-21'
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
      allure includeProperties: false, jdk: '', results: [
        [path: 'allure-results']
      ]
    }
  }
}