#!/bin/bash

echo "[curl.sh] Will sleep for $SLEEP_TIME seconds to let Kafka Connect init..."
sleep $SLEEP_TIME
echo "[curl.sh] Sending Requests..."
curl --silent -X POST -H "Content-Type: application/json" -d @/source.json http://kafka-connect:8083/connectors -w "\n"
curl --silent -X POST -H "Content-Type: application/json" -d @/target.json http://kafka-connect:8083/connectors -w "\n"
echo "[curl.sh] List of connectors:"
curl --silent http://kafka-connect:8083/connectors