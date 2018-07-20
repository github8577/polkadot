FROM phusion/baseimage:0.10.1
LABEL maintainer "chevdor@gmail.com"

ARG POLKADOT_VERSION=v0.2
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y cmake pkg-config libssl-dev && \
	curl https://sh.rustup.rs -sSf | sh -s -- -y && \
	echo 'PATH="$/root/.cargo/bin:$PATH";' >> ~/.bash_profile && \
	. ~/.bash_profile && . /root/.cargo/env && \
	which rustup && which cargo && \
	rustup update nightly && \
	rustup target add wasm32-unknown-unknown --toolchain nightly && \
	rustup update stable && rustup default stable && \
	cargo install --git https://github.com/alexcrichton/wasm-gc --force && \
	cargo install --git https://github.com/pepyakin/wasm-export-table.git --force && \
	apt-get install -y git vim curl wget && \
	git clone https://github.com/paritytech/polkadot.git && cd polkadot && \
	git fetch origin ${POLKADOT_VERSION}:${POLKADOT_VERSION} && \
	git checkout ${POLKADOT_VERSION} && \
	./build.sh && cargo build

WORKDIR /polkadot
CMD ["/bin/sh", "polkadot"]
