pipeline {
  agent none
  stages {
    stage('Build Maven') {
      steps {
        sh './mvnw install -DskipTests'
      }
    }
  }
}