FROM golang:1.11-stretch as stage1
LABEL maintainer="<your email>"

ADD . /go/src/github.com/TriggerMail/<service dir>

RUN go install -v github.com/TriggerMail/<service dir>

# A lightweight Dockerfile
FROM gcr.io/distroless/base:latest
LABEL maintainer="<your email>"

WORKDIR /app

# Default to a non-root user
USER 1000
EXPOSE 8080

COPY --from=stage1 /go/bin/<service dir> /

ENTRYPOINT ["/<service dir>", "--addr", ":8080"]
