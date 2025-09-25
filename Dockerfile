# Build stage
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q -e -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -q -DskipTests package

# Runtime stage
FROM eclipse-temurin:21-jre
WORKDIR /opt/app
ENV JAVA_OPTS=""
#COPY --from=build /app/target/*.jar /opt/app/app.jar
COPY --from=build /app/target/poc-maven-azure-app-0.0.1-SNAPSHOT.jar /opt/app/app.jar
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s --start-period=15s CMD wget -qO- http://127.0.0.1:8080/health || exit 1
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar /opt/app/app.jar"]

