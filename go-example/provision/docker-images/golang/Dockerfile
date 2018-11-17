FROM golang:1.11-alpine

RUN apk add --update git make gcc openssh bash

RUN go get -u -f github.com/Masterminds/glide

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD tail -f /dev/null


