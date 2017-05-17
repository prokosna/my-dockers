#!/bin/bash

DATA_CONTAINER=prometheus_data_1

cd ~/services/prometheus

echo "INFO: Stopping containers..."
docker-compose stop

echo "INFO: Backup starts..."
docker run --rm --volumes-from $DATA_CONTAINER -v $(pwd)/backup:/backup boombatower/docker-backup backup "$(date +%F_%R).tar.xz"
echo "INFO: Done!"

echo "INFO: Restarting containers..."
docker-compose start
echo "INFO: Now containers in service"
