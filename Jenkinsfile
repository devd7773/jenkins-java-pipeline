pipeline {
	agent {
	      label "my-slave"
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
             stage("build the image from dockerfile") {
	          steps {
		  	sh "docker build -t java-image:$BUILD_TAG ."
			sh "docker tag java-image:$BUILD_TAG dev7773/java-image:$BUILD_TAG"
		  }
	     }
	     stage("push the docker") {
	     	  steps {
		  	withCredentials([string(credentialsId: 'docker-hub-cred', variable: 'my_cred')]) {
				sh "docker login -u dev7773 -p ${my_cred}"
				sh "docker push dev7773/java-image:$BUILD_TAG"
                        }
		  }
	     }
             stage("test the code in docker container") {
	          steps {
		  	sh "docker run -dit --name java-tomcat-$BUILD_tag -p 80-90:8080 java-image:$BUILD_TAG"
		  }
	     }
             stage("QAT") {
		  steps {
			sh "curl http://localhost:80-90"
		  }
	     }
	     
	}

}
