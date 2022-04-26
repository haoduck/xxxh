#!/bin/sh

rm -rf /config.json
cat << EOF > /config.json
{
  "inbounds": [
    {
      "port": $PORT,
      "protocol": "${PROTOCOL:-vless}",
      "settings": {
        "decryption": "none",
        "clients": [
          {
            "id": "${UUID:-b831381d-6324-4d53-ad4f-8cda48b30811}"
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "${WS_PATH:-/}"
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

xray -c /config.json
