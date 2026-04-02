# Tor + Privoxy Docker Container

Docker контейнер с прокси-цепочкой: HTTP → Privoxy → Tor → SOCKS5

## Возможности

- 🔒 Анонимный прокси-сервер на базе Tor
- 🌐 HTTP/HTTPS прокси через Privoxy (порт 8118)
- 🔌 SOCKS5 прокси через Tor (порт 9050)
- 📡 DNS резолвинг через Tor (порт 5353)

## Быстрый старт

### Сборка образа

```bash
docker build -t tor-privoxy .