# 1) Etapa de build
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app
COPY pom.xml mvnw .mvn/ ./
COPY src/ src/
RUN ./mvnw clean package -DskipTests

# 2) Etapa de runtime
FROM eclipse-temurin:17-jre
WORKDIR /app
ARG JAR=project-microservices-0.0.1-SNAPSHOT.jar
COPY --from=build /app/target/${JAR} app.jar
EXPOSE 8761
ENTRYPOINT ["java","-jar","/app.jar"]
