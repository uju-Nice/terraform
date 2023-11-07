pipeline {
    agent any
    
    parameters {
  choice choices: ['dev ', 'qa ', 'statge', ' prod'], description: 'Select the environment you want ', name: 'Environment'
}
    
    stages {
  stage('Build') {
    steps {
     echo 'jenkins-Build'
    }
  }

  stage('Testing') {
    steps {
          echo 'Testing'
    }
  }

  stage('Deploy') {
    steps {
         echo 'Deploying'
    }
  }

}

   
    
}
