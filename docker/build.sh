#!/bin/sh

docker build -t polkadot:0.2 .;
docker run -it polkadot:0.2 bash;
