pipeline {

  agent 
  {
    label 'terraform'
  }

  environment {
     TF_LOG = 'INFO'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
        withCredentials([file(credentialsId: 'terraform-auth', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {

  
       // sh 'mkdir -p creds'
        sh 'echo $GOOGLE_APPLICATION_CREDENTIALS'
       // sh 'echo $GC_KEY |base64 -d  > ./creds/serviceaccount.json'
        }
      }
    }
    stage('TF init') {
       steps {
         container('terraform') {
           withCredentials([file(credentialsId: 'terraform-auth', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
            sh 'terraform init'
            sh 'terraform plan -out myplan'
           }
         }
       }
     }
   }
}
