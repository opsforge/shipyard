#!/bin/bash

echo "
Destroying shipyard cluster...
"

docker-compose -p shipyard down

echo "
Cluster removed.
"
