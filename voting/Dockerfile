# Stage 1: Build stage
FROM schoolofdevops/maven:spring AS build
WORKDIR /app
COPY . .
RUN mvn package -DskipTests

# Stage 2: Runtime stage
FROM gcr.io/distroless/java17-debian12:nonroot
WORKDIR /app
COPY --from=build /app/target/voting-0.0.1-SNAPSHOT.jar voting.jar
EXPOSE 8080
CMD ["voting.jar"]

