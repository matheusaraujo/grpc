#!/bin/sh

# Update package list and install dependencies
apk update && \
apk add go curl

# Download and install Protobuf
PB_REL="https://github.com/protocolbuffers/protobuf/releases"
curl -LO $PB_REL/download/v25.1/protoc-25.1-linux-x86_64.zip && \
unzip protoc-25.1-linux-x86_64.zip -d $HOME/.local && \
rm protoc-25.1-linux-x86_64.zip

# Add protoc to PATH
export PATH="$PATH:$HOME/.local/bin"

# Install Go gRPC and Protobuf plugins
go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.35.1
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.5.1
