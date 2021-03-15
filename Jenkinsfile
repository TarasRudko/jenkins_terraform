pipeline {

  agent any

  environment {
    // SVC_ACCOUNT_KEY = credentials('terraform-auth')
  }

  stages {    
    stage('TF Plan') {
       steps {
         container('terraform') {
           sh 'terraform version'
          // sh 'terraform init'
          // sh 'terraform plan -out myplan'
         }
       }
     }
   }
}
