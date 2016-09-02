#!/bin/bash

CURPATH=`pwd`
CONTAINER_HOSTS=${CURPATH}/docker-container-hosts

autoCreateHostsFile() {
    echo "# auto generated by $0" > ${CONTAINER_HOSTS}
    for CID in `sudo docker ps -q`;do
        IP=`sudo docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${CID}`
        NAME=`sudo docker inspect --format '{{ .Config.Hostname }}' ${CID}`
        echo "${IP} ${NAME}" >> ${CONTAINER_HOSTS}
        echo "${IP} ${NAME}"
    done
}

autoCreateHostsFile
echo "您需要手动将这个文件中的信息，写到/etc/hosts文件中去 !"