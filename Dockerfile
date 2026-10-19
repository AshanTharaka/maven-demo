# Stage 1: Build the application
FROM maven:3.9.16-eclipse-temurin-11 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package

# Stage 2: Run the application
FROM eclipse-temurin:11-jre

WORKDIR /app

COPY --from=build /app/target/maven-demo-1.0.0.jar app.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "app.jar"]