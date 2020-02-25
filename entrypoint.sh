#!/bin/bash
set -e

CMD="$@"

if [[ -z "${v2ray}" ]];
then
    ARGS="-c /etc/shadowsocks/config.json -u"
else
    if [ "$CMD" == "ss-local" ];
    then
      OPS="server;tls;fast-open;host=${HOST};path=/v2ray;"
    else
      OPS="server;tls;fast-open;host=${HOST};path=/v2ray;cert=/certificates/${HOST}/fullchain.pem;key=/certificates/${HOST}/privkey.pem;"
    fi
    ARGS="-c /etc/shadowsocks/config.json -u --plugin v2ray-plugin --plugin-opts \"$OPS\""
fi

eval "$CMD" "$ARGS"
