## Setup instructions

* Install [Docker Community Edition (CE)](https://www.docker.com/community-edition) and run on your chosen operating system

* Build and run the Docker container using a shell script and enter its shell

```bash
. build.sh
```

* Start a PoC-2 validator node

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

* Watch your validator at https://telemetry.polkadot.io/. If you've requested and obtained testnet DOTs see yourself generating blocks