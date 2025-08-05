#!/bin/bash
cd /home/container
chown container:container .
sleep 1
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

MODIFIED_STARTUP=$(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

eval ${MODIFIED_STARTUP}
