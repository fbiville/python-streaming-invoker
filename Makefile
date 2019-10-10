.PHONY: proto help

.DEFAULT_GOAL := help

SOURCE_PROTO_FOLDER="./proto"
SOURCE_PROTO_FILE="${SOURCE_PROTO_FOLDER}/riff-rpc.proto"
OUTPUT_PROTO_FOLDER="./lib/invoker"

gen-proto: ## generate the proto Python file
	pipenv run python -m grpc_tools.protoc -I${SOURCE_PROTO_FOLDER} \
        --python_out=${OUTPUT_PROTO_FOLDER} \
        --grpc_python_out=${OUTPUT_PROTO_FOLDER} ${SOURCE_PROTO_FILE}

# source: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Print help for each make target
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'