FROM tomcat:latest
RUN mv /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps 
COPY ./target/*.jar /usr/local/tomcat/webapps/java-app.jar
