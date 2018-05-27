#!/bin/sh
DOMAIN=$PROJECT_NAME$SITES_TDL
AVAILABLE_LOCATION=$NGINX_AVAILAVLE_SITES_DIR$PROJECT_NAME$SITES_TDL
ENABLED_LOCATION=$NGINX_ENABLED_SITES_DIR$PROJECT_NAME$SITES_TDL

cat <<EOM >$AVAILABLE_LOCATION
server {
    listen 80;
    listen [::]:80;
    root $PROJECT_BASE_DIR$PROJECT_NAME/public_html;

    index index.php index.html index.htm index.nginx-debian.html;

    server_name $DOMAIN;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \.php\$ {
       include snippets/fastcgi-php.conf;
       fastcgi_pass $FASTCGI_PASS;
    }
}
EOM
echo "Creating Symlink form available to enabled"
ln -s $AVAILABLE_LOCATION $ENABLED_LOCATION
echo "Checking for errors"
nginx -t
echo "Restarting Nginx"
service nginx restart