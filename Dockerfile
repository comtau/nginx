FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y wireguard-tools iproute2 nginx procps && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY nginx/nginx.conf /etc/nginx/nginx.conf

CMD ["/start.sh"]
