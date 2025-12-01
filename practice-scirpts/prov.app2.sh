#!/bin/bash
echo update start
sudo apt update

echo upgrade start
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

echo nginx install
sudo  DEBIAN_FRONTEND=noninteractive apt install nginx -y

echo reverse proxy
sudo sed -i 's|try_files \$uri \$uri/ =404;|proxy_pass http://127.0.0.1:3000;|' /etc/nginx/sites-available/default
sudo systemctl restart nginx

echo nodejs curl
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
sudo DEBIAN_FRONTEND=noninteractive bash nodesource_setup.sh
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs -y

echo git clone 
git clone https://github.com/OlliKm/tech515_sparta_app_to_clone.git repo 
cd repo/app

echo connect to db priv ip to go to posts 
export DB_HOST=mongodb://172.31.25.55:27017/posts
printenv DB_HOST

npm install

echo install pm2
sudo npm install -g pm2

pm2 stop all
pm2 start app.js

