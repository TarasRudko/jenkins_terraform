pipeline {

  agent
  {
    label 'cd-jenkins-jenkins-agent'
  }

  environment {
     SVC_ACCOUNT_KEY = credentials('terraform-auth')
  }

  stages {    
    stage('TF test') {
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
