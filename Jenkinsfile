pipeline {
  agent {
    docker {
      image 'cypress-base-jdk'
    }
  }
  stages {
    stage('build and test') {
      steps {
        sh "rm -rf allure-results && rm -rf allure-report | true"
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