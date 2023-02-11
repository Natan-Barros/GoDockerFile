FROM golang:alpine3.10 as build

WORKDIR /projects/golang

COPY hello.go /projects/golang

RUN go mod init hello.go
RUN go build -a -installsuffix cgo -ldflags="-w -s" -o hello .
RUN go mod tidy

FROM scratch

WORKDIR /projects/golang
COPY --from=build  /projects/golang/hello .

CMD ["./hello"]