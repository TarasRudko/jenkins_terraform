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
        withCredentials([file(credentialsId: 'terraform-auth', variable: 'GC_KEY')]) {

  
        sh 'mkdir -p creds'
        sh 'echo $GC_KEY'
        sh 'echo $GC_KEY |base64 -d  > ./creds/serviceaccount.json'
        }
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
