#!/bin/bash

echo "
Launching shipyard using compose v3...
"

docker-compose -p shipyard up -d

echo "
Cluster launched and ready for access.
"
