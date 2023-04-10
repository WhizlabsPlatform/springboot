FROM gradle as builder
WORKDIR /app
COPY . .
RUN ./gradlew build --stacktrace
 
FROM openjdk
WORKDIR /app
EXPOSE 8080
COPY --from=builder /app/build/libs/springboot-0.0.1.jar .
CMD java -jar springboot-0.0.1.jar