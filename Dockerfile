FROM tomcat:latest

COPY ./target/*.jar /usr/local/tomcat/webapps/java-app.jar
