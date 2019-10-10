#!/bin/bash
set -Eeuxo pipefail

SOURCE_FOLDER="./proto"
SOURCE_PROTO_FILE="${SOURCE_FOLDER}/riff-rpc.proto"
OUTPUT_FOLDER="./lib/invoker"

pipenv run python -m grpc_tools.protoc -I${SOURCE_FOLDER} \
  --python_out=${OUTPUT_FOLDER} \
  --grpc_python_out=${OUTPUT_FOLDER} \
  ${SOURCE_PROTO_FILE}
