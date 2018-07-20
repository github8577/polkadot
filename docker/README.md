## Setup instructions

* Install [Docker Community Edition (CE)](https://www.docker.com/community-edition) and run on your chosen operating system

* Build Docker image polkadot_sandbox and run the generated Docker container using a shell script and enter its Bash terminal shell

```bash
. build.sh
```

* Start your PoC-2 validator node #1 in an instance of the Docker container

```bash
./target/debug/polkadot \
  --validator \
  --base-path /tmp/my-validator \
  --chain krummelanke \
  --execution both \
  --keystore-path /home/polkadot/keys \
  --name "enter your desired Polkadot validator screen name" \
  --node-key "enter your Polkadot account address without 0x prefix" \
  --port 30333 \
  --pruning 256 \
  --rpc-port 9933 \
  --telemetry-url ws://telemetry.polkadot.io:1024 \
  --ws-port 9944
```

* Start PoC-2 validator node #2 in other Terminal window.

```bash
docker exec -it $(docker ps -q) bash
```

* Watch your validators at https://telemetry.polkadot.io/. If you've requested and obtained testnet DOTs see yourself generating blocks

### Docker Tips

* Show all Docker containers

```bash
docker ps -a
```

* Show all Docker images

```bash
docker images
```

* Show Docker Machine information

```bash
docker inspect <CONTAINER_ID>
```

* Removal all Docker images and containers
  * Manually

    ```bash
    docker ps -l
    docker ps -a
    docker stop <CONTAINER_ID>
    docker rm <CONTAINER_ID>
    docker images
    docker rmi <IMAGE_ID>
    ```

  * Automatically

    ```bash
    . destroy.sh
    ```