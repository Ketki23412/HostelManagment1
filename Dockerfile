FROM tomcat:9.0
EXPOSE 8080
COPY target/HostelManagementSystem.war /usr/locat/tomcat/webapps/HostelManagementSystem.war
