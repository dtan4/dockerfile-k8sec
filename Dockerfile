FROM alpine:3.5

ENV K8SEC_VERSION 0.3.0

RUN apk add --no-cache --update ca-certificates

RUN apk add --no-cache --update --virtual .install-deps \
      wget \
    && wget -q https://github.com/dtan4/k8sec/releases/download/v$K8SEC_VERSION/k8sec-v$K8SEC_VERSION-linux-amd64.tar.gz \
    && tar zxf k8sec-v$K8SEC_VERSION-linux-amd64.tar.gz \
    && cp linux-amd64/k8sec /k8sec \
    && rm -rf linux-amd64 \
    && rm k8sec-v$K8SEC_VERSION-linux-amd64.tar.gz \
    && apk del .install-deps

ENTRYPOINT ["/k8sec"]
