#!/bin/bash

service nginx stop

rm -rf /etc/nginx/conf.d
rm -rf /etc/nginx/sites*
rm -rf /etc/nginx/stream*
rm -rf /etc/nginx/nginx.conf
rm -rf /etc/nginx/workers.conf

cp -r /root/scripts/lanparty/std-proxy-cache/configs-linux/etc-nginx/* /etc/nginx

mkdir -p /etc/nginx/stream-enabled
ln -sf /etc/nginx/stream-available/* /etc/nginx/stream-enabled/

mkdir -p /etc/nginx/sites-enabled
ln -sf /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

service nginx start