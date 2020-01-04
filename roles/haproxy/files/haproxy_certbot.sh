#!/usr/bin/env bash
DOMAIN='sdn.template.com'

mkdir -p /etc/haproxy/certs
cat /etc/letsencrypt/live/$DOMAIN/fullchain.pem /etc/letsencrypt/live/$DOMAIN/privkey.pem > /etc/haproxy/certs/$DOMAIN.pem
chmod -R go-rwx /etc/haproxy/certs
sed -i '/frontend\ https/,$d' /etc/haproxy/haproxy.cfg
cat << EOF >> /etc/haproxy/haproxy.cfg

frontend https
   bind *:443 ssl crt /etc/haproxy/certs/${DOMAIN}.pem
   reqadd X-Forwarded-Proto:\ https
   default_backend habackend
EOF
systemctl restart haproxy