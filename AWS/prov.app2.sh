#!/bin/bash

sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

sudo  DEBIAN_FRONTEND=noninteractive apt install nginx -y

### replacing the lines in the nginx default to a proxy pass of 3000

sudo sed -i 's|try_files \$uri \$uri/ =404;|proxy_pass http://127.0.0.1:3000;|' /etc/nginx/sites-available/default
sudo systemctl restart nginx

### Getting node off the web and downloading it 
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
sudo DEBIAN_FRONTEND=noninteractive bash nodesource_setup.sh
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs -y

sudo rm -r repo

### cloning the github repo with the app files in it into a file called repo
git clone https://github.com/OlliKm/tech515_sparta_app_to_clone.git repo 
cd repo/app

### connecting db-hosts to a variable for mongodb and putting in DB priv ip and local host to allow for us to access /posts
export DB_HOST=mongodb://172.31.22.91:27017/posts
printenv DB_HOST

### now we have nodejs installed we can now install
npm install

### installing pm2 to run app in background
sudo npm install -g pm2

### stopping any running jobs then start to make sure its fresh and the port isn't occupied. 
pm2 stop all
pm2 start app.js

