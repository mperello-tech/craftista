FROM schoolofdevops/maven:spring AS build
WORKDIR /app
COPY . .
RUN mvn package -DskipTests


FROM openjdk:17-alpine AS run
RUN useradd -m nonroot
USER nonroot
WORKDIR /home/nonroot/run
COPY --from=build --chown=nonroot:nonroot /app/target/voting-0.0.1-SNAPSHOT.jar voting.jar
EXPOSE 8080
CMD java -jar voting.jar
