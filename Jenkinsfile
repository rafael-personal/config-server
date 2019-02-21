pipeline {
  agent {
    docker {
      image 'openjdk:8u171-alpine3.7'
    }

  }
  stages {
    stage('Build Maven') {
      steps {
        sh './mvnw install -DskipTests'
      }
    }
  }
}