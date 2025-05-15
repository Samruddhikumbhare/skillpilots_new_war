FROM tomcat:10.1.40-jdk17

ARG WAR_FILE
COPY ${WAR_FILE} /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8001

CMD ["catalina.sh", "run"]
