FROM maven:3-openjdk-8 AS build

WORKDIR /tmp

COPY pom.xml .
COPY src ./src
RUN mvn package
RUN ls -la target

FROM openjdk:8-jre-buster
WORKDIR /app
COPY --from=build /tmp/target/JMusicBot-Snapshot-All.jar .

CMD ["java", "-jar", "JMusicBot-Snapshot-All.jar"]
