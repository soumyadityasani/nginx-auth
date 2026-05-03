#!/bin/sh
# Extract the real DNS resolver from /etc/resolv.conf
RESOLVER=$(grep nameserver /etc/resolv.conf | awk '{print $2}' | head -1)
echo "Using DNS resolver: $RESOLVER"

# Substitute it into the nginx config
sed "s/__RESOLVER__/$RESOLVER/g" /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Start nginx
exec nginx -g 'daemon off;'