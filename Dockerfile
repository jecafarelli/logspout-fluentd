FROM golang:1.10.3-stretch as build

COPY . /go/src/logspout
WORKDIR /go/src/logspout
RUN ./bin/build.sh

FROM scratch

COPY --from=build /go/src/logspout/logspout /
CMD ["/logspout"]
