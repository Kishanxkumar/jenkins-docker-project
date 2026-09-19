FROM eclipse-temurin:21-jre

COPY target/jenkins-docker-project-1.0.jar /app.jar

CMD ["java", "-cp", "/app.jar", "com.example.App"]


