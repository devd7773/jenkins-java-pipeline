pipeline {
	agent {
	      label "my-ubuntu-slave"
	}
	stages {
	     stage("pulling the code from scm") {
	          steps {
		  	git branch: 'main', url: 'https://github.com/devd7773/jenkins-java-pipeline.git'
		  }
	     }
	     stage("build the code") {
	     	  steps {
		  	sh "mvn dependency:purge-local-repository"
			sh "mvn clean package"
		  }
	     }
}
