FROM golang:1.20-alpine
RUN adduser -D "nonroot" nonroot
USER nonroot
WORKDIR /home/nonroot/app
COPY . .
RUN go build -o app
CMD ["./app"]

