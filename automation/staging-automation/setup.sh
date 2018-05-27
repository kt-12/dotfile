#!/bin/sh
. ./config.sh
echo "Enter Project Name : "
read PROJECT_NAME
echo  "- Creating Project Folder '$PROJECT_BASE_DIR$PROJECT_NAME' "
mkdir -p $PROJECT_BASE_DIR$PROJECT_NAME"/public_html"
echo  "- Initiating Nginx Setup for the project '"$PROJECT_NAME"' with domain name '"$PROJECT_NAME$SITES_TDL"' "
. ./nginx.sh
echo  "--------------------------------- NGINX PROCESS END  --------------------------------------------------------"
echo  "- Adding Entry '127.0.0.1 $PROJECT_NAME$SITES_TDL' to hosts file"
echo  "127.0.0.1 $PROJECT_NAME$SITES_TDL" >> $HOSTS_FILE_PATH
echo  "--------------------------------- ENTRY ADDED TO HOST FILE ---------------------------------------------------"
echo  "- Creating Project Git Folder '$PROJECT_BASE_DIR$PROJECT_NAME/git' "
mkdir $PROJECT_BASE_DIR$PROJECT_NAME"/git"
echo "- Enter git repo link :"
read GIT_LINK
git clone $GIT_LINK $PROJECT_BASE_DIR$PROJECT_NAME/git
echo  "- Changing user permission "
chown -R $WEB_USER_GROUP $PROJECT_BASE_DIR$PROJECT_NAME

