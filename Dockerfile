FROM adoptopenjdk/maven-openjdk8

VOLUME /cfg
COPY foodie.yml /cfg/foodie.yml

# Add source files
COPY ./src /src
COPY pom.xml /pom.xml

# Package the jar
RUN mvn package -DskipTests

# Add jar to app folder
RUN mkdir /app
RUN cp /target/foodie-standalone.jar /app/foodie-standalone.jar
RUN chmod +x /app/foodie-standalone.jar

# Remove unnecessary files
RUN rm -rf /src
RUN rm -rf /target

WORKDIR /app

CMD ["java", "-jar", "foodie-standalone.jar", "server", "/cfg/foodie.yml"]
