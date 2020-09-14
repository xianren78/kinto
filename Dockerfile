FROM alpine
COPY --from=builder /tmp/v2ray.tgz /tmp
RUN apk update && apk add --no-cache  --no-install-recommends wget ca-certificates openssh-server openssh-sftp-server unzip bsdmainutils   \
    	&& mkdir /wwwroot \
    	&& cd /wwwroot \
    	&& wget --no-check-certificate -qO 'demo.tar.gz' "https://github.com/xianren78/v2ray-heroku/raw/master/demo.tar.gz" \
    	&& wget http://atl.lg.virmach.com/100MB.test \
    	&& tar xvf demo.tar.gz \
    	&& rm -rf demo.tar.gz \
    	&& mkdir /v3raybin \
    	&& cd /v3raybin  \
    	&& wget --no-check-certificate https://github.com/v2fly/v2ray-core/releases/download/v4.28.1/v2ray-linux-64.zip \
    	&& unzip v2ray-linux-64.zip v2ray v2ctl geosite.dat geoip.dat -d /v3raybin/ \
    	&& rm -rf ./v2ray-linux-64.zip \
    	&& chmod +x /v3raybin/v2ray /v3raybin/v2ctl \
    	&& mv /v3raybin/v2ray /v3raybin/v3ray
    	&& mkdir /caddybin  \  	
    	&& cd /caddybin   \  	
     	&& wget --no-check-certificate -qO 'caddy.tar.gz' https://github.com/caddyserver/caddy/releases/download/v1.0.4/caddy_v1.0.4_linux_amd64.tar.gz  \  	
    	&& tar xvf caddy.tar.gz  \  	
    	&& rm -rf caddy.tar.gz   \  	
    	&& chmod +x caddy	\
    	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone 
    
ADD ./authorized_keys /etc/ssh/authorized_keys
RUN chmod 600 /etc/ssh/authorized_keys
ADD ./sshd_config /etc/ssh/sshd_config
ADD daemon.sh /v3raybin/daemon.sh
RUN chmod +x /v3raybin/daemon.sh
ADD traffic.sh /v3raybin/traffic.sh
RUN chmod +x /v3raybin/traffic.sh
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ADD ./.profile.d /app/.profile.d
CMD  bash /app/.profile.d/heroku-exec.sh
