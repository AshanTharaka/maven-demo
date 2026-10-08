# Stage 1: Build
FROM maven:3.9.16-eclipse-temurin-11 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package


# Stage 2: Runtime
FROM eclipse-temurin:11-jre

WORKDIR /app

COPY --from=build /app/target/maven-demo-1.0-SNAPSHOT.jar app.jar

CMD ["java", "-jar", "app.jar"]