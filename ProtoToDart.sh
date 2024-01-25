#!/bin/bash

protoc --dart_out=grpc:lib/generated -Iprotos -Iprotos google/protobuf/wrappers.proto

for file in protos/*.proto; do
    protoc --dart_out=grpc:lib/Generated -Iprotos $file
done