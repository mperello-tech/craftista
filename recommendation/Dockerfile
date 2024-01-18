FROM golang:alpine as builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o app .

FROM alpine:latest
WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

COPY --from=builder /app/app .

COPY config.json .
COPY templates/ templates/
COPY static/ static/
COPY data/ data/

EXPOSE 8080
CMD ["./app"]

