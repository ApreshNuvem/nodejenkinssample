#!groovy



node {
   currentBuild.result = "SUCCESS"
	def nodeHome = tool 'NodeJs9'
    env.PATH="${env.PATH}:${nodeHome}/bin"
  
    try {

       stage('Checkout'){

          checkout scm
       }

       stage('Test'){

        env.NODE_ENV = "test"

        print "Environment will be : ${env.NODE_ENV}"
        
		echo "INSTALLING DEPENDENCIES"
		bat "\"${nodeHome}\"\\npm install"
       
	   echo "RUN STATIC ANALYSIS (JSHINT)"
	   bat "jshint . --exclude-path .jshintignore.txt --reporter=checkstyle > D:/nodemicroservices/nodejenkinssample/target/check-style-results.xml"

	   echo "RUN MOCHA TEST LOCALLY"
	  
       }

     
       stage('Deploy'){

         echo 'Push to Repo'
         echo 'ssh to web server and tell it to pull new image'
         
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