pipeline {
    environment {
     JENKINS_BACKUP_FILE_NAME = ''
    }
    agent {
        label 'master'
    }
    stages {
        stage('Backing up Jenkins') {
            steps {
                script {
                    JENKINS_BACKUP_FILE_NAME = sh (
                        script: '''#!/bin/bash
                            # find latest backup
                            thinbackup_path="$JENKINS_HOME/thinBackup"
                            echo $thinbackup_path
                            latest_backup_folder=$(ls -t $thinbackup_path | head -n1)
                            full_path="$thinbackup_path/$latest_backup_folder"
                           
                            # pack it up
                            backup_name="$latest_backup_folder.tar.gz"
                            echo $backup_name
                            tar -cvzf $backup_name -P $full_path
                            echo ${backup_name}
                            ''',
                        returnStdout: true
                    ).trim().tokenize().last()
                }
                step([$class: 'ClassicUploadStep', credentialsId: 'es-s2dl-core-d-duplicate-key-added',  
                bucket: "gs://es-s2dl-core-d-build-tools/backups/",
                      pattern: JENKINS_BACKUP_FILE_NAME])
                
                sh '''
                 rm '''+JENKINS_BACKUP_FILE_NAME+'''
                '''
            }
        }
    }
}
