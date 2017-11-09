#!groovy



node {
    currentBuild.result = "SUCCESS"
	def nodeHome = tool 'NodeJs9'
    env.PATH="${env.PATH}:${nodeHome}/bin"
  
    try {

	git credentialsId: 'apreshrokalla', url: 'https://github.com/apreshrokalla007/nodejenkinssample.git'

       stage('Checkout'){

          checkout scm
       }
	   	   
	   stage('Install Dependencies'){
	    	echo "INSTALLING DEPENDENCIES"			
			bat "\"${nodeHome}\"\\npm install"			
	   }
		
       stage('Test'){

        env.NODE_ENV = "test"
        print "Environment will be : ${env.NODE_ENV}"
        
	    echo "RUN STATIC ANALYSIS (JSHINT)"
	    bat "jshint . --exclude-path .jshintignore.txt --reporter=checkstyle > target/check-style-results.xml"
        checkstyle canComputeNew: false, defaultEncoding: '', healthy: '', pattern: 'target/check-style-results.xml', unHealthy: ''

	    echo "RUN TEST"
			bat "\"${nodeHome}\"\\npm test"
        }

	    stage('Prepare Database'){
		    echo "CONNECTING TO POSTGRES"
		    echo "EXECUTING THE DUMP FILE"
		   
	   }

     
       stage('Deploy'){

         echo 'Push to Repo'         
		withCredentials([usernamePassword(credentialsId: 'machinegit', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
			bat "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@beckermediaapp.git"
		}
         
       }

       stage('Cleanup'){

         echo 'prune and cleanup'
         bat "\"${nodeHome}\"\\npm prune"
         bat "\"${nodeHome}\"\\rm node_modules -rf"
/*
         mail body: 'project build successful',
                     from: 'apresh.rokalla@appshark.com',
                     replyTo: 'apresh.rokalla@appshark.com',
                     subject: 'project build successful',
                     to: 'apresh.rokalla@appshark.com'
                     */
        input "Deploy to prod?"                     
       }



    }
    catch (err) {
		echo 'Error'
        currentBuild.result = "FAILURE"

		/*
            mail body: "project build error is here: ${env.BUILD_URL}" ,
            from: 'apresh.rokalla@appshark.com',
            replyTo: 'apresh.rokalla@appshark.com',
            subject: 'project build failed',
            to: 'apresh.rokalla@appshark.com'
			*/
        
        throw err
    }
}