# First stage
FROM maven:3.9.2 AS builder

# add pom.xml and source code
ADD . .

# packager jar/war
RUN mvn clean package

# second stage
FROM openjdk:8-jre-alpine

# copy jar file from previous stage
COPY --from=builder target/my-app-1.0-SNAPSHOT.jar my-app-1.0-SNAPSHOT.jar 

EXPOSE 8080

CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
