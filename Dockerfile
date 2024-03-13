FROM ubuntu:latest
SHELL ["/bin/bash", "-c"]

WORKDIR /usr/src/myapp

RUN apt-get update && \
    apt-get install -y curl build-essential libssl-dev pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Install Rust tools
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Install Rust dependencies
RUN cargo install cargo-dylint dylint-link
RUN cargo install mdbook
