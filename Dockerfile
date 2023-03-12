FROM openjdk:11-jdk-slim

ARG JAR_FILE=target/sectors-app-*.jar
WORKDIR /app
COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]