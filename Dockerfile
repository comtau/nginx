FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y wireguard-tools iproute2 nginx procps && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY wg0.conf /etc/wireguard/wg0.conf
COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN echo '#!/bin/sh\n\
wg-quick up wg0\n\
nginx -g "daemon off;"' > /start.sh && chmod +x /start.sh

CMD ["/start.sh"]
