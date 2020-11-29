# Base Ontop image
FROM ontop/ontop-endpoint

# Move to workdir
WORKDIR /opt/ontop

# Config and ontology files
COPY input/university-complete.ttl input/university-complete.obda input/university-complete.docker.properties input/ 

# Ports
EXPOSE 8080

# H2 version
ENV H2_VERSION "1.4.197"

# Download
ADD "https://repo1.maven.org/maven2/com/h2database/h2/${H2_VERSION}/h2-${H2_VERSION}.jar" jdbc/h2.jar

# Entry point
ENTRYPOINT java -cp ./lib/*:./jdbc/* -Dlogback.configurationFile=file:./log/logback.xml \
        it.unibz.inf.ontop.cli.Ontop endpoint \
        --ontology=input/university-complete.ttl \
        --mapping=input/university-complete.obda \
        --properties=input/university-complete.docker.properties \
        --cors-allowed-origins=http://yasgui.org 
     
