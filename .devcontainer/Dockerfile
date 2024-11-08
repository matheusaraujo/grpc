FROM alpine:3.20.3

RUN apk add --no-cache git curl openssh

COPY setup-go.sh /setup-go.sh
RUN /setup-go.sh