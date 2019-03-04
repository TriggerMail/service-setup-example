FROM golang:1.11-stretch as stage1
LABEL maintainer="madeline.neumiller@bluecore.com"

ADD . /go/src/github.com/TriggerMail/customers

RUN go install -v github.com/TriggerMail/customers

# A lightweight Dockerfile
FROM gcr.io/distroless/base:latest
LABEL maintainer="madeline.neumiller@bluecore.com"

WORKDIR /app

# Default to a non-root user
USER 1000
EXPOSE 8080

COPY --from=stage1 /go/bin/customers /

ENTRYPOINT ["/customers", "--addr", ":8080"]
