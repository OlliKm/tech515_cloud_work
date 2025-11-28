#!/bin/bash

# when running the app ami make sure to input this script into the user data to make sure it runs.
cd repo/app

#connect to database - change ip per new instance
export DB_HOST=mongodb://172.31.29.159/posts
printenv DB_HOST
 
 #put in the reverse proxy 
sudo sed -i "s|try_files \$uri \$uri/ =404;|proxy_pass http://127.0.0.1:3000;|" /etc/nginx/sites-available/default

sudo systemctl reload nginx

#install pm2
 sudo npm install -g pm2

#run app only script 
# start app and enable reboot startup
pm2 start app.js 
pm2 enable app.js
pm2 save