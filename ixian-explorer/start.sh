#!/bin/sh -e
if [ -f "update.next" ]; then
  apt-get update --yes
  apt-get upgrade --yes

  cd ~/Ixian/Ixian-Explorer
  git pull --rebase
  
  DLT_HOST=`sed -n 's/^$dlt_host\s*=\s*\"\(.*\)\"\s*;/\1/p' /var/www/html/config.php`

  cp -R ~/Ixian/Ixian-Pool/www/* /var/www/html/
  sed -i "/^\$db_host\s*=.*/ s//\$db_host = \"localhost\";/" /var/www/html/config.php
  sed -i "/^\$db_user\s*=.*/ s//\$db_user = \"explorer01\";/" /var/www/html/config.php
  sed -i "/^\$db_pass\s*=.*/ s//\$db_pass = \"explorer01\";/" /var/www/html/config.php

  sed -i "/^\$dlt_host\s*=.*/ s//\$dlt_host = \"$DLT_HOST\";/" /var/www/html/config.php
  
  rm ~/update.next
fi

service mariadb restart
service apache2 restart
service cron restart

sleep infinity