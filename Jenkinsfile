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
    stage('end') {
      steps {
        mail(subject: 'Build Complete', body: 'Success Build', bcc: 'rafael.fernandez.ve@gmail.com', from: 'rafael.fernandez.ve@gmail.com', to: 'rafael.fernandez.ve@gmail.com')
      }
    }
  }
}