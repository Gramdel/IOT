#!/bin/bash

echo "[rs-init.sh] Will sleep for $SLEEP_TIME seconds to let MongoDB init..."
sleep $SLEEP_TIME
echo "[rs-init.sh] Running rs.initiate()..."
mongosh --quiet --eval "rs.initiate({ _id: 'rs0', members: [{ _id: 0, host: 'localhost:27017' }] })"