pipeline {
    agent any
     stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/RajaniLekkala/testProject'
             }
         }
        
        stage('Restore Packages') {
            steps {
              bat "dotnet restore"
            }
        }
        
       stage('Build') {
     	steps {
    	     bat 'dotnet build MarysMajesticMovies.sln'
     	}
       }	
        stage('Pack') {
   	steps {
    	    bat 'dotnet pack --no-build --output nupkgs'
   	}
      } 
         stage('Run') {
            steps {
                bat 'START /B dotnet C:/Users/rajani/.jenkins/workspace/testProject/MarysMajesticMovies/bin/Debug/netcoreapp3.1/MarysMajesticMovies.dll'
            }
        }
        stage('UI tests') {
            steps {
                   
                    bat 'robot movies.robot'
            }
        }
     }
      post {
        always {
            junit '**/TEST*.xml'
            emailext attachLog: true, attachmentsPattern: '**/TEST*xml', body: '', recipientProviders: [culprits()], 	subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!'

        }
    }
    
 }
