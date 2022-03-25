# Go GRPC Docker Image

This image contains everything needed to generate GRPC code for Golang.

## Usage

```
docker run --rm -v "${PWD}":/app kulti/gogrpc:go-1.16-1 protoc -I ../api --go_out=. --go-grpc_out=. myservice.proto
```
