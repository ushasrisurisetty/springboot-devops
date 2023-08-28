FROM gradle:6.8.3-jdk11 as builder

COPY . /home/gradle/project
WORKDIR /home/gradle/project

RUN gradle build

FROM openjdk:11-jre-slim

COPY --from=builder /home/gradle/project/build/libs/*.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]
