pipeline {
agent {dockerfile true}
    environment{ 
            DATABRICKS_TOKEN_MAIN=credentials('token-adb')  
            }
    
    stages { 
        stage('deploy') {
           // agent { dockerfile
           //        {
           //        filename 'Dockerfile'
           //        args '-e VARIABLE_NAME=${DATABRICKS_TOKEN_MAIN}'
           //        }
           //       }
           when { branch 'main' }
            
            steps {  
//            echo "${DATABRICKS_HOST_MAIN}\n${DATABRICKS_TOKEN_MAIN}" | databricks configure --token --profile main
                    // sh '''
                        
                    //      echo "$DATABRICKS_HOST_MAIN\n$DATABRICKS_TOKEN_MAIN" | databricks configure --token --profile DEV
                        
                    //  '''  
                         //sh "chmod +x -R ${env.WORKSPACE}" 
                         sh "/opt/scripts/config.sh"     
                // DDL deployment
                     sh '''
                         DDL_FOLDER=/Workspace/Shared/DDL
                         echo $DDL_FOLDER
                         databricks workspace import_dir DDL $DDL_FOLDER --exclude-hidden-files --overwrite
                     '''
            }
        }
    }
}
