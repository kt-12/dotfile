#!/bin/sh
PROJECT_BASE_DIR="/data/projects/"
SITES_TDL=".dv"
HOSTS_FILE_PATH="/etc/hosts"
NGINX_AVAILAVLE_SITES_DIR="/etc/nginx/sites-available/"
NGINX_ENABLED_SITES_DIR="/etc/nginx/sites-enabled/"
FASTCGI_PASS="unix:/var/run/php/php7.2-fpm.sock"
WEB_USER_GROUP="kikk:www-data"