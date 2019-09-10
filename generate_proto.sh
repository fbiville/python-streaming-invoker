#!/bin/bash
set -Eeuo pipefail

SOURCE_FOLDER="./proto"
SOURCE_PROTO_FILE="${SOURCE_FOLDER}/riff-rpc.proto"
OUTPUT_FOLDER="./lib/invoker"

python3 -m grpc_tools.protoc -I${SOURCE_FOLDER} \
  --python_out=${OUTPUT_FOLDER} \
  --grpc_python_out=${OUTPUT_FOLDER} \
  ${SOURCE_PROTO_FILE}