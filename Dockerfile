ARG PROTOC_VERSION=3.19.4
ARG PROTOC_GEN_GO_VERSION=1.28.0
ARG PROTOC_GEN_GO_GRPC_VERSION=1.2.0

ARG GO_VERSION
FROM golang:${GO_VERSION}

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*


ARG PROTOC_VERSION
RUN curl -L -o /tmp/protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip \
    && unzip /tmp/protoc.zip -d /opt/protoc \
    && chmod +x /opt/protoc/bin/protoc \
    && ln -s /opt/protoc/bin/protoc /usr/bin/protoc

ARG PROTOC_GEN_GO_VERSION
ARG PROTOC_GEN_GO_GRPC_VERSION
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v${PROTOC_GEN_GO_VERSION}
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v$PROTOC_GEN_GO_GRPC_VERSION

WORKDIR /app
