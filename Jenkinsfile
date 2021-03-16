pipeline {

  agent 
  {
    label 'terraform'
  }

  environment {
     SVC_ACCOUNT_KEY = credentials('terraform-auth')
  }

  stages {    
    stage('TF init') {
       steps {
         container('terraform') {
          sh 'cat ./creds/serviceaccount.json'
          sh 'terraform init'
          sh 'terraform plan -out myplan'
         }
       }
     }
   }
}
