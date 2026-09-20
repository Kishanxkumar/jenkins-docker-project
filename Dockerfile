FROM eclipse-temurin:21-jre

COPY target/jenkins-docker-project-1.0.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]
