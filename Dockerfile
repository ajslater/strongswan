ARG ALPINE_VERSION
FROM alpine:$ALPINE_VERSION
ARG PKG_VERSION
LABEL maintainer="AJ Slater <aj@slater.net>"
LABEL version=${ALPINE_VERSION}_${PKG_VERSION}

RUN apk add --no-cache \
    iptables \
    ip6tables \
    sudo \
    strongswan=$PKG_VERSION;

COPY 99-strongswan.conf /etc/sysctl.d/
COPY run.sh /

CMD ["/run.sh"]
