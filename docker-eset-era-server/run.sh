#!/bin/bash

echo "Iniciando servidor X"
[ -e /tmp/.X1-lock ] && Xvfb :1 -screen 0 800x600x16 -ac -pn -noreset &

while ! nc -z "$DB_HOSTNAME" 3306 ; do sleep 3; done
[ -e /opt/eset/RemoteAdministrator/Server/ERAServer ]  || /usr/local/bin/install.sh
[ -e /opt/eset/RemoteAdministrator/Server/ERAServer ] && /opt/eset/RemoteAdministrator/Server/ERAServer
