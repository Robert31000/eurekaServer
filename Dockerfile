# Etapa 1: construir con Maven
FROM maven:3.9.0-eclipse-temurin-17 AS build
WORKDIR /app

# Sólo copia pom y descarga dependencias
COPY pom.xml .
RUN mvn dependency:go-offline

# Copia el resto del código y compila el jar
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa 2: runtime mínimo
FROM eclipse-temurin:17-jdk
WORKDIR /

# Copia el jar compilado
COPY --from=build /app/target/*.jar app.jar

# Expone el puerto de Eureka
EXPOSE 8761

# Arranca la aplicación
ENTRYPOINT ["java","-jar","/app.jar"]
