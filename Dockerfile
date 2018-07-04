FROM alpine:latest
MAINTAINER AJ Slater <aj@slater.net>

RUN apk add --update iptables ip6tables sudo strongswan; \
    rm -rf /var/cache/apk/*

COPY 99-strongswan.conf /etc/sysctl.d/
COPY run.sh /

CMD ["/run.sh"]
