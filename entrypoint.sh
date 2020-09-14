#! /bin/bash

if [[ -z "${UUID}" ]]; then
  UUID="4890bd47-5180-4b1c-9a5d-3ef686543112"
fi

if [[ -z "${AlterID}" ]]; then
  AlterID="10"
fi

if [[ -z "${V2_Path}" ]]; then
  V2_Path="/FreeApp"
fi

if [[ -z "${V2_QR_Path}" ]]; then
  V2_QR_Code="1234"
fi

cat <<-EOF > /v2raybin/config.json
{
	"log": {
		"loglevel": "warning",
		"access": "/v2raybin/access.log",
         "error": "/v2raybin/error.log"
	},
	"inbounds": [{
			"listen": "127.0.0.1",
			"port": 10010,
			"protocol": "dokodemo-door",
			"settings": {
				"address": "127.0.0.1"
			},
			"tag": "api"
		},
		{
			"port": 10001,
			"listen": "127.0.0.1",
			"tag": "ss",
			"protocol": "shadowsocks",
			"settings": {
				"method": "chacha20-ietf-poly1305",
				"ota": false,
				"password": "${PASSWORD}",
				"network": "tcp,udp"
			},
			"streamSettings": {
				"network": "ws",
				"wsSettings": {
					"path": "${SS_Path}"
				}
			}
		},
		{
              "tag": "ws",
			"port": 10000,
			"listen": "127.0.0.1",
			"protocol": "vmess",
			"settings": {
	            "clients":[
                {
                    "id":"${UUID}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "admin@test.com"
                },
		{
                    "id":"${UUID1}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "test@test.com"
                },
		{
                    "id":"${UUID2}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "mp@test.com"
                },
		{
                    "id":"${UUID3}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "dxb@test.com"
                },
		{
                    "id":"${UUID4}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "wj@test.com"
                },
		{
                    "id":"${UUID5}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "wsl@test.com"
                },
		{
                    "id":"${UUID6}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "ycz@test.com"
                },
		{
                    "id":"${UUID7}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "qjl@test.com"
                },
		{
                    "id":"${UUID8}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "hxf@test.com"
                },
		{
                    "id":"${UUID9}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "llc@test.com"
                },
		{
                    "id":"${UUID10}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "ld@test.com"
                },
		{
                    "id":"${UUID11}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "wu.hb@test.com"
                }]
			},
			"streamSettings": {
				"network": "ws",
				"wsSettings": {
					"path": "${V2_Path}"
				}
			}
		},
		{
			"port": 10004,
			"listen": "127.0.0.1",
			"protocol": "vless",
			"tag": "ws-vless",
			"settings": {
	            "clients":[
                {
                    "id":"${UUID}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "admin@test.com"
                },
		{
                    "id":"${UUID1}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "test@test.com"
                },
		{
                    "id":"${UUID2}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "mp@test.com"
                },
		{
                    "id":"${UUID3}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "dxb@test.com"
                },
		{
                    "id":"${UUID4}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "wj@test.com"
                },
		{
                    "id":"${UUID5}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "wsl@test.com"
                },
		{
                    "id":"${UUID6}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "ycz@test.com"
                },
		{
                    "id":"${UUID7}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "qjl@test.com"
                },
		{
                    "id":"${UUID8}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "hxf@test.com"
                },
		{
                    "id":"${UUID9}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "llc@test.com"
                },
		{
                    "id":"${UUID10}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "ld@test.com"
                },
		{
                    "id":"${UUID11}",
                    "alterId":${AlterID},
			        			"level": 0,
			        			"email": "wu.hb@test.com"
                }],
 			"decryption": "none"
			},
			"streamSettings": {
				"network": "ws",
				"wsSettings": {
					"path": "${VLESS_Path}"
				}
			}
		}
	],
	"policy": {
		"levels": {
			"0": {
				"statsUserUplink": true,
				"statsUserDownlink": true
			}
		},
    "system": {
        "statsInboundUplink": true,
        "statsInboundDownlink": true
    }
	},
	"stats": {},
	"api": {
		"services": [
			"StatsService"
		],
		"tag": "api"
	},
	"outbounds": [{
		"protocol": "freedom",
		"settings": {},
		"tag": "direct"
	},
		{
			"protocol": "blackhole",
			"settings": {},
			"tag": "blocked"
		}],
	"routing": {
		"rules": [{
				"inboundTag": [
					"api"
				],
				"outboundTag": "api",
				"type": "field"
			},
			{
				"type": "field",
				"ip": [
					"geoip:private"
				],
				"outboundTag": "blocked"
			}
		]
	}
}
EOF

cat <<-EOF > /caddybin/Caddyfile
http://0.0.0.0:${PORT}
{
	root /wwwroot
	index index.html
	timeouts none
	proxy ${V2_Path} localhost:10000 {
		websocket
		header_upstream -Origin
	}
	proxy ${SS_Path} localhost:10001 {
		websocket
		header_upstream -Origin
	}
    proxy ${VLESS_Path} localhost:10004 {
       websocket
       header_upstream -Origin
  }
}
EOF

cat <<-EOF > /v2raybin/vmess.json 
{
    "v": "2",
    "ps": "Heroku",
    "add": "cm.richin.ltd",
    "port": "21111",
    "id": "${UUID1}",
    "aid": "${AlterID}",			
    "net": "ws",			
    "type": "none",			
    "host": "${customdomain}",			
    "path": "${V2_Path}",	
    "tls": "tls"			
}
EOF

if [ "$AppName" = "no" ]; then
  echo "不生成二维码"
else
  mkdir /wwwroot/$V2_QR_Path
  vmess="vmess://$(cat /v2raybin/vmess.json | base64 -w 0)" 
  Linkbase64=$(echo -n "${vmess}" | tr -d '\n' | base64 -w 0) 
  echo "${Linkbase64}" | tr -d '\n' > /wwwroot/$V2_QR_Path/index.html
  echo "${vmess}" | tr -d '\n' > /wwwroot/$V2_QR_Path/index.html
  echo -n "${vmess}" | qrencode -s 6 -o /wwwroot/$V2_QR_Path/v2.png
fi

/usr/sbin/sshd
/v2raybin/v2ray -config=/v2raybin/config.json &
/caddybin/caddy -conf=/caddybin/Caddyfile &
/v2raybin/daemon.sh