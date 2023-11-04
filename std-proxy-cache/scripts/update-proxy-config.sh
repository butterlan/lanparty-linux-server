#!/bin/bash

source /root/scripts/lanparty/common.inc

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

# Configure variables
set -e
sed -i "s/CACHE_INDEX_SIZE/${CACHE_INDEX_SIZE}/" /etc/nginx/conf.d/20_proxy_cache_path.conf
sed -i "s/CACHE_DISK_SIZE/${CACHE_DISK_SIZE}/" /etc/nginx/conf.d/20_proxy_cache_path.conf
sed -i "s/CACHE_MAX_AGE/${CACHE_MAX_AGE}/" /etc/nginx/sites-available/cache.conf.d/root/20_cache.conf
sed -i "s/CACHE_MAX_AGE/${CACHE_MAX_AGE}/" /etc/nginx/conf.d/20_proxy_cache_path.conf
sed -i "s/UPSTREAM_DNS/${UPSTREAM_DNS}/" /etc/nginx/sites-available/cache.conf.d/10_root.conf
sed -i "s/UPSTREAM_DNS/${UPSTREAM_DNS}/" /etc/nginx/stream-available/10_sni.conf

service nginx start