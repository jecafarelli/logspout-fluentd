#!/usr/bin/env bash

go get -v
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -a -installsuffix cgo logspout .
