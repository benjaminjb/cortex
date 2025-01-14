FROM golang:1.16
ENV CGO_ENABLED=0
RUN go get github.com/go-delve/delve/cmd/dlv

FROM alpine:3.14

RUN     mkdir /cortex
WORKDIR /cortex
ADD     ./cortex ./
COPY --from=0 /go/bin/dlv ./
