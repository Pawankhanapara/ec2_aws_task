FROM openjdk:8-jdk
RUN apt-get update && apt-get install -y maven
COPY pom.xml /usr/pom.xml
COPY src /usr/src
WORKDIR /usr
EXPOSE 3030
RUN mvn clean package
ENTRYPOINT ["java","-jar","target/spring-boot-docker.jar"]
