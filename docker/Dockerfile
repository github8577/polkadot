FROM phusion/baseimage:0.10.1
LABEL maintainer "chevdor@gmail.com"

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y cmake pkg-config libssl-dev && \
	curl https://sh.rustup.rs -sSf | sh && \
	rustup update nightly && \
	rustup target add wasm32-unknown-unknown --toolchain nightly && \
	rustup update stable && \
	cargo install --git https://github.com/alexcrichton/wasm-gc && \
	git clone https://github.com/paritytech/polkadot.git && \
	cd polkadot && \
	./build.sh && \
	cargo build

WORKDIR /polkadot
CMD ["/bin/sh", "polkadot"]
