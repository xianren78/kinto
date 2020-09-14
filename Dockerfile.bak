FROM heroku/heroku:16

RUN apt update -y \
    	&& apt upgrade -y \
    	&& apt install -y wget unzip qrencode bsdmainutils openssh-server openssh-sftp-server curl bash python bash nano vim net-tools \
    	&& mkdir /wwwroot \
    	&& cd /wwwroot \
    	&& wget --no-check-certificate -qO 'demo.tar.gz' "https://github.com/xianren78/v2ray-heroku/raw/master/demo.tar.gz" \
    	&& wget http://atl.lg.virmach.com/100MB.test \
    	&& tar xvf demo.tar.gz \
    	&& rm -rf demo.tar.gz \
    	&& mkdir /v2raybin \
    	&& cd /v2raybin  \
    	&& wget --no-check-certificate https://github.com/v2fly/v2ray-core/releases/download/v4.28.1/v2ray-linux-64.zip \
    	&& unzip v2ray-linux-64.zip v2ray v2ctl geosite.dat geoip.dat -d /v2raybin/ \
    	&& rm -rf ./v2ray-linux-64.zip \
    	&& chmod +x /v2raybin/v2ray /v2raybin/v2ctl \
    	&& mkdir /caddybin  \  	
    	&& cd /caddybin   \  	
   	&& wget --no-check-certificate -qO 'caddy.tar.gz' https://github.com/caddyserver/caddy/releases/download/v1.0.4/caddy_v1.0.4_linux_amd64.tar.gz  \  	
    	&& tar xvf caddy.tar.gz  \  	
    	&& rm -rf caddy.tar.gz   \  	
    	&& chmod +x caddy	\
    	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
     && echo "Asia/Shanghai" > /etc/timezone \
     && rm /bin/sh \
     && ln -s /bin/bash /bin/sh

ADD ./authorized_keys /etc/ssh/authorized_keys
RUN chmod 600 /etc/ssh/authorized_keys
ADD ./sshd_config /etc/ssh/sshd_config
ADD daemon.sh /v2raybin/daemon.sh
RUN chmod +x /v2raybin/daemon.sh
ADD traffic.sh /v2raybin/traffic.sh
RUN chmod +x /v2raybin/traffic.sh
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ADD ./.profile.d /app/.profile.d
CMD  bash /app/.profile.d/heroku-exec.sh
