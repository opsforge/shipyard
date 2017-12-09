#!/bin/bash

echo "
Launching shipyard using compose v3...
"
if echo $1 | grep -i qc &>/dev/null ; then
  echo "QC run identified, using QC compose file"
  docker-compose -f docker-compose-qc.yaml -p shipyard up -d
else
  docker-compose -p shipyard up -d
fi

echo "
Cluster launched and ready for access.
"
