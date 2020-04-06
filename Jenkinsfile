pipeline {
    agent any
     stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/RajaniLekkala/team3'
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
    
 }