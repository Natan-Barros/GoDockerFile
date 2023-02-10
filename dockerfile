FROM golang:alpine as build

WORKDIR /projects/golang

COPY hello.go /projects/golang

RUN go mod init hello.go
RUN go mod tidy
RUN go build -ldflags "-s -w" -o hello .

FROM alpine

WORKDIR /projects/golang
COPY --from=build  /projects/golang/hello .

CMD ["./hello"]