echo "### Setting up NGINX SNI-Proxy"

mkdir -p /etc/nginx/stream-enabled
ln -sf /etc/nginx/stream-available/* /etc/nginx/stream-enabled/

# Configure variables
set -e
sed -i "s/UPSTREAM_DNS/${UPSTREAM_DNS}/" /etc/nginx/sites-available/upstream.conf.d/10_resolver.conf

systemctl restart nginx.service >> $LOGFILE 2>&1
#eof
