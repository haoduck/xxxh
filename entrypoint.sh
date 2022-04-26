#!/bin/bash
cat << EOF > /etc/xray/config.json
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

#run xray

xray -c /etc/xray/config.json
