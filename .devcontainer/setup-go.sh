#!/bin/sh

apk add --no-cache go

PROTOC_VERSION=25.1
PROTOC_GEN_GO_VERSION=1.35.1
PROTOC_GEN_GO_GRPC_VERSION=1.5.1

curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip
unzip protoc-$PROTOC_VERSION-linux-x86_64.zip -d $HOME/.local
rm protoc-$PROTOC_VERSION-linux-x86_64.zip
echo "export PATH=\$PATH:$HOME/.local/bin" >> /etc/profile
go install google.golang.org/protobuf/cmd/protoc-gen-go@v$PROTOC_GEN_GO_VERSION
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v$PROTOC_GEN_GO_GRPC_VERSION
