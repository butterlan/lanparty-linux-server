echo "### Setting up NGINX SNI-Proxy"

mkdir -p /etc/nginx/stream-enabled
ln -sf /etc/nginx/stream-available/* /etc/nginx/stream-enabled/

systemctl restart nginx.service >> $LOGFILE 2>&1
#eof
