pipeline {
  agent any
  stages {
    stage('Build Maven') {
      steps {
        sh './buil.sh'
      }
    }
    stage('deploy') {
      steps {
        sh './deploy.sh dev'
      }
    }
  }
}