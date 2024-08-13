pipeline {
	agent {
	      label "my-slave"
	}
	stages {
	     stage("pulling the code from scm") {
	          steps {
		  	git 'https://github.com/devd7773/jenkins-java-pipeline.git'
		  }
	     }
	     stage("build the code") {
	     	  steps {
		  	sh "mvn dependency:purge-local-repository"
			sh "mvn clean package"
		  }
	     }
             stage("build the image from dockerfile") {
	          steps {
		  	sh "docker build -t java-image:$BUILD_TAG ."
		  }
	     }
             stage("test the code in docker container") {
	          steps {
		  	sh "docker run -dit --name java-tomcat:$BUILD_NUMBER -p 80:8080 java-image:$BUILD_TAG"
		  }

	     }
	}

}
