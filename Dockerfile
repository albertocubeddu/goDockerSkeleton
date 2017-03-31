FROM golang:1.8

# Copy entrypoint
COPY docker/entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN mkdir -p /go/src/app
WORKDIR /go/src/app

ADD . /go/src/app
RUN go get github.com/tools/godep
RUN godep restore
RUN go-wrapper install
RUN go-wrapper download

ENTRYPOINT ["/entrypoint.sh"]