#!/bin/sh

# Add the Polkadot version number to environment variables
. version.sh; echo $CARGO_POLKADOT_VERSION;
CARGO_POLKADOT_VERSION_FOR_DOCKERFILE=${CARGO_POLKADOT_VERSION:0:3};
echo $CARGO_POLKADOT_VERSION_FOR_DOCKERFILE;
docker-compose up --force-recreate --build -d;
docker exec -it $(docker ps -q) bash
