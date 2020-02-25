FROM acrisliu/shadowsocks-libev

WORKDIR /ss/shadowsocks

# Start shadowsocks-libev server
ADD ./entrypoint.sh /ss/shadowsocks/entrypoint.sh
ADD ./config.json /etc/shadowsocks/config.json

ENV MODE ss-server

ENTRYPOINT ["sh","/ss/shadowsocks/entrypoint.sh"]

CMD ["ss-server"]
