FROM tomcat:9-jdk11
EXPOSE 8080
COPY target/*.war /usr/local/tomcat/webapps/HostelManagementSystem.war
