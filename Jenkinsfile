pipeline {
  agent any
  stages {
    stage('Build Maven') {
      steps {
        sh './mvnw install -DskipTests'
      }
    }
    stage('deploy') {
      steps {
        sh './deploy.sh dev'
      }
    }
  }
}