#!/bin/bash

java \
   -cp /var/lib/h2/h2.jar \
   org.h2.tools.Server \
   -web -webDaemon -webAllowOthers -webPort 8082 \
   -tcp -tcpAllowOthers -tcpPort 9082 \
   -baseDir /usr/lib/h2
