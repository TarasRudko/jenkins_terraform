pipeline {

  agent 
  {
    label 'terraform'
  }

  environment {
     TF_LOG = '' // Use TRACE for debug info
    
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
            sh 'terraform plan -out plan-to-deploy'
           }
         }
       }
     }
    stage('Approval') {
      steps {
        script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
      }
    }    
    stage('TF Apply') {
      steps {
        container('terraform') {
          withCredentials([file(credentialsId: 'terraform-auth', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
            sh terraform apply -input=false plan-to-deploy'
          }
        }
      }
    }
   }
}
