#!/bin/bash

SLEEP_TIME=10

docker-compose up -d

echo "Trying to create a topic..."
docker-compose exec -it kafka kafka-topics --bootstrap-server localhost:9092 --create --topic metrics

echo "Creating tables and views..."
docker-compose exec -it clickhouse-server clickhouse-client --query="
	CREATE TABLE queue (
		message String
	) ENGINE = Kafka('kafka:9092', 'metrics', 'group', 'JSONAsString');
"
docker-compose exec -it clickhouse-server clickhouse-client --query="
	CREATE TABLE metrics (
		id UInt64,
		name String,
		difficulty UInt64,
		solved Boolean
	) ENGINE = MergeTree() ORDER BY id;
"
docker-compose exec -it clickhouse-server clickhouse-client --query="
	CREATE MATERIALIZED VIEW consumer TO metrics AS
	SELECT 
		JSONExtractString(message, 'id') as id,
		JSONExtractString(message, 'name') as name,
		JSONExtractString(message, 'difficulty') as difficulty,
		JSONExtractString(message, 'solved') as solved
	FROM queue;
"

echo "Sending a message..."
docker-compose exec -it kafka sh -c "kafka-console-producer --broker-list localhost:9092 --topic metrics < /payload.json"

echo "Sleeping for $SLEEP_TIME sec..."
sleep $SLEEP_TIME
echo "DID IT WORK???"
docker-compose exec -it clickhouse-server clickhouse-client --format=Pretty --query="
	SELECT * FROM consumer;
"