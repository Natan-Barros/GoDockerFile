FROM golang:alpine

WORKDIR /projects/golang

COPY hello.go /projects/golang

RUN go build hello.go

CMD ["./hello"]