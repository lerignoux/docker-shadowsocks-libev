# Shadowsocks-libev Dockerfile
This Dockerfile build an image for [shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev/) with [v2ray-plugin](https://github.com/shadowsocks/v2ray-plugin), based on Alpine Linux.

Current version:
- shadowsocks-libev: v3.3.4
- v2ray-plugin: v1.3.0


## Quick Start

Get the docker image by running the following commands:

```bash
docker pull lerignoux/shadowsocks-libev
cp ./config.tpl.json ./config.json
```

Start a server instance:
```bash
docker run -d --name=shadowsocks-libev -v <config_path>:/etc/shadowsocks/config.json -p 8388:8388/tcp -p 8388:8388/udp lerignoux/shadowsocks-libev
```

And the client
```bash
docker run -d --name=shadowsocks-libev -v <config_path>:/etc/shadowsocks/config.json -p 8388:8388/tcp -p 8388:8388/udp lerignoux/shadowsocks-libev ss-local
```

## Configuration
edit the `config.tpl.json` with the settings you wish


## Using v2ray plugin
### tldr
```bash
docker run -d --name=shadowsocks-libev -v <config_path>:/etc/shadowsocks/config.json -e v2ray=1 -e HOST="your.host.com" -v <acme_path>/:certificates -p 8388:8388/tcp -p 8388:8388/udp lerignoux/shadowsocks-libev
```

your acme folder must container a container with your hostname and the following files: `fullchain.pem`, `privkey.pem`

for instance if my host is `my.host.com`, ensure:
`<acme_path>/my.host.com/fullchain.pem`
`<acme_path>/my.host.com/privkey.pem`

Server:
```bash
docker run -d --name=shadowsocks-libev -v <config_path>:/etc/shadowsocks/config.json -e v2ray=1 -e HOST="your.host.com" -v <acme_path>/:/certificates -p 8388:8388/tcp -p 8388:8388/udp lerignoux/shadowsocks-libev
```

Client:
```bash
docker run -d --name=shadowsocks-libev -v <config_path>:/etc/shadowsocks/config.json.json -e v2ray=1 -e HOST="your.host.com" -p 8388:8388/tcp -p 8388:8388/udp lerignoux/shadowsocks-libev ss-local
```

For more v2ray-plugin configrations please go to [v2ray plugin docs](https://github.com/shadowsocks/v2ray-plugin/blob/master/README.md)


## With docker-compose
see `docker-compose.tpl.yml`
