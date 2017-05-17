#!/bin/bash

if [ -z $1 ]
then
  echo "Usage: ./restore.sh [backup_file_name]"
  exit 1
fi

BACKUP_FILE=$1
DATA_CONTAINER=prometheus_data_1

cd ~/services/prometheus

echo "INFO: Stopping containers..."
docker-compose stop

echo "INFO: Restoring..."
docker run --rm --volumes-from $DATA_CONTAINER -v $(pwd)/backup:/backup boombatower/docker-backup restore $BACKUP_FILE
echo "INFO: Done!"

echo "INFO: Restarting containers..."
docker-compose start
echo "INFO: Now containers in service"
