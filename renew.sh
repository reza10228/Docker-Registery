#!/bin/bash
docker stop $(docker ps -aq)
service nginx start
certbot renew
service nginx stop
cd /etc/letsencrypt/live/docker.domain.ir/
cp /etc/letsencrypt/live/docker.domain.ir/privkey.pem /etc/letsencrypt/live/docker.domain.ir/domain.key
cat /etc/letsencrypt/live/docker.domain.ir/cert.pem /etc/letsencrypt/live/docker.domain.ir/chain.pem > /etc/letsencrypt/live/docker.doamin.ir/domain.crt
docker start $(docker ps -aq)
