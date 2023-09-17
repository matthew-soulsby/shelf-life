FROM openjdk:8-jdk-alpine

VOLUME /cfg
COPY foodie.yml /cfg/foodie.yml

COPY target/foodie-standalone.jar /app/foodie-standalone.jar

WORKDIR /app

CMD ["java", "-jar", "foodie-standalone.jar", "server", "/cfg/foodie.yml"]
