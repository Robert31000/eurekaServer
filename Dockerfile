############## 1) ETAPA DE BUILD ##############
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# 1-a  – wrapper y POM
COPY mvnw mvnw.cmd pom.xml ./
COPY .mvn .mvn         

# 1-b  – código fuente
COPY src src

RUN ./mvnw -q clean package -DskipTests

############## 2) ETAPA DE RUNTIME ############
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8761
ENTRYPOINT ["java","-jar","app.jar"]
