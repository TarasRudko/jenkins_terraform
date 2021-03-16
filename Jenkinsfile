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
          sh 'terraform init'
          sh 'terraform plan -out myplan'
         }
       }
     }
   }
}
