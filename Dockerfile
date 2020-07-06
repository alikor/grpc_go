FROM golang

ENV PATH="/protoc/bin:${PATH}"

RUN apt-get update && \ 
    apt-get -y install autoconf automake libtool curl make g++ unzip

RUN protoc_version=3.12.3 \
    && wget -O protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v$protoc_version/protoc-$protoc_version-linux-x86_64.zip \  
    && mkdir -p /protoc && unzip protoc.zip -d /protoc

RUN go get -u google.golang.org/grpc
RUN go get -u github.com/golang/protobuf/proto
RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc
 