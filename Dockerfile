FROM alpine:latest

RUN apk update
RUN apk add bash python3 tar net-tools

WORKDIR /openbsd
