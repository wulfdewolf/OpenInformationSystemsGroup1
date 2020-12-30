# Base Java image
FROM openjdk:8-jre-slim

# Move to workdir
WORKDIR /var/lib/h2

# Ports
EXPOSE 8082

# H2 version
ENV H2_VERSION "1.4.200"

# Download
ADD "https://repo1.maven.org/maven2/com/h2database/h2/${H2_VERSION}/h2-${H2_VERSION}.jar" h2.jar

# Entry point
ENTRYPOINT java \
   -cp /var/lib/h2/h2.jar \
   org.h2.tools.Server \
   -web -webDaemon -webAllowOthers -webPort 8082 \
   -tcp -tcpAllowOthers -tcpPort 9082 \
   -baseDir /usr/lib/h2
