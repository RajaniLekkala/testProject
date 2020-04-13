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
        stage('Clean') {
   	steps {
    	    bat 'dotnet clean'
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
     }
      post {
        always {
            junit '**/TEST*.xml'
            emailext attachLog: true, attachmentsPattern: '**/TEST*xml', body: '', recipientProviders: [culprits()], 	subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!'

        }
    }
    
 }