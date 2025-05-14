FROM tomcat:9-jdk17

ARG JAR_FILE
COPY ${JAR_FILE} /usr/local/tomcat/webapps/app.war

EXPOSE 8001

CMD ["catalina.sh", "run"]
