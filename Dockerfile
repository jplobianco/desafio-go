FROM golang:latest AS builder

COPY ./hello .

RUN go build -o /usr/bin/hello

FROM scratch

COPY --from=builder /usr/bin/hello /usr/bin/hello

ENTRYPOINT ["/usr/bin/hello"]
