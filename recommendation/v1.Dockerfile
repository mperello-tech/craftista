FROM golang:1.20 as build
WORKDIR /go/src/app
COPY . .
RUN go build -o app
CMD ["./app"]

