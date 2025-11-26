# --- STAGE 1: BUILD THE APPLICATION ---
FROM registry.access.redhat.com/ubi8/openjdk-17:1.23-3.1759823914 AS builder

# Set the working directory inside the container
WORKDIR /build

# Copy Maven wrapper files and pom.xml first to leverage Docker layer caching
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

# Copy the application source code
COPY src src

# Grant execution permission to the Maven wrapper script
# RUN chmod +x mvnw

# Package the application (build the final JAR)
# We use the Maven Wrapper (./mvnw) which is standard for Spring Boot projects.
# RUN chmod +x mvnw && ./mvnw package -DskipTests
RUN sh ./mvnw package -DskipTests

# --- STAGE 2: CREATE THE FINAL RUNTIME IMAGE ---
# Use the same base image for consistency and environment matching,
# but only include the necessary runtime components.
FROM registry.access.redhat.com/ubi8/openjdk-17:1.23-3.1759823914

# Set the working directory for the runtime
WORKDIR /app

# Copy the executable JAR from the build stage
# The JAR file is typically named 'your-project-name.jar'
COPY --from=builder /build/target/*.jar DemoApp.jar

# Expose the default Spring Boot port
ENV PORT ${{ values.port }}
EXPOSE ${{ values.port }}

# Switch to a non-root user for security (UID 1001 is a common non-root user in UBI)
USER 1001

# Command to run the application when the container starts
ENTRYPOINT ["java", "-jar", "DemoApp.jar"]