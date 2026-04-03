FROM alpine:latest

## Установка необходимых пакетов

RUN apk add --no-cache tor privoxy

## Конфигурация Tor

RUN cat > /etc/tor/torrc <<EOF
SOCKSPort 0.0.0.0:9050
DNSPort 0.0.0.0:5353
AutomapHostsOnResolve 1
EOF

## Конфигурация Privoxy

RUN echo "listen-address 0.0.0.0:8118" >> /etc/privoxy/config && \
    echo "forward-socks5t / 127.0.0.1:9050 ." >> /etc/privoxy/config

## Порты
# 9050 - SOCKS-порт Tor
# 5353 - DNS-порт Tor
# 8118 - HTTP-прокси Privoxy
EXPOSE 9050 5353 8118

## Запуск Tor в фоне, а Privoxy на переднем плане
CMD ["sh", "-c", "tor & privoxy --no-daemon /etc/privoxy/config"]