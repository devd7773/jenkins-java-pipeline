FROM tomcat:latest
RUN mkdir /usr/local/tomcat/webapps/devsa
RUN mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps 
COPY ./target/*.jar /usr/local/tomcat/webapps/devsa/java-app.jar
