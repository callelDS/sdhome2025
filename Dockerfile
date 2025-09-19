# Etapa 1: Build com Maven
FROM maven:3.9.11-eclipse-temurin-24 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
# Etapa 2: Runtime com JDK leve
FROM eclipse-temurin:24-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]