#!/bin/sh

docker-compose up --force-recreate --build -d;
docker exec -it $(docker ps -q) bash
