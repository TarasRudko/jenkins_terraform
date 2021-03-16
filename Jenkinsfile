pipeline {

  agent 
  {
    label 'terraform'
  }

  environment {
     SVC_ACCOUNT_KEY = credentials('terraform-auth')
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
        sh 'mkdir -p creds'
        sh 'echo $SVC_ACCOUNT_KEY > ./creds/serviceaccount.json'
      }
    }
    stage('TF init') {
       steps {
         container('terraform') {
          sh 'terraform init'
          sh 'terraform plan -out myplan'
         }
       }
     }
   }
}
