# Base Java image
FROM openjdk:8-jre-slim

# Move to workdir
WORKDIR /var/lib/h2

# Startup script
COPY h2.sh .

# Ports
EXPOSE 8082

# H2 version
ENV H2_VERSION "1.4.197"

# Download
ADD "https://repo1.maven.org/maven2/com/h2database/h2/${H2_VERSION}/h2-${H2_VERSION}.jar" h2.jar

# Rights
RUN chmod u+x h2.sh

# Entry point
ENTRYPOINT ./h2.sh
