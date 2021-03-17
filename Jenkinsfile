pipeline {

  agent {     label 'terraform'   }

  parameters {
    string(name: 'FORCE_PROJECT_ID', defaultValue: 'ruta2-303211', description: 'Use Google Project ID despite the branch name')
  }
  environment {
    PROJECT_ID = '${FORCE_PROJECT_ID}' //or(params.FORCE_PROJECT_ID, inferProject('ss-pp-build-d'))
    REGION = 'us-central1'
    ZONE = 'us-central1-c'
    TIER = relaxedEnvJson("${PROJECT_ID}_labels")["tier"].toString()
    GOOGLE_APPLICATION_CREDENTIALS = credentials('terraform-auth')
  }  
  stages {
    stage('Checkout') {
      steps {
        checkout scm
          
       // sh 'mkdir -p creds'
        sh 'echo $GOOGLE_APPLICATION_CREDENTIALS'
       // sh 'echo $GC_KEY |base64 -d  > ./creds/serviceaccount.json'
        
      }
    }
    stage('TF init') {
       steps {
         container('terraform') {
            sh 'terraform init'
            sh 'terraform plan -out plan-to-deploy'
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
            sh 'terraform apply -input=false plan-to-deploy'
          }
        }
      }
    }
  }
}
