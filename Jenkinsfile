pipeline {
  agent any
  stages {
    stage('Build Maven') {
      steps {
        sh './build.sh'
      }
    }
    stage('deploy') {
      steps {
        sh './deploy.sh dev'
      }
    }
  }
}
