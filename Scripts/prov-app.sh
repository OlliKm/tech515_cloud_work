
#!/bin/bash
 
# purpose: provision software + configuration to run Sparta Node JS test app
# works on: AWS EC2 instance running Ubuntu 22.04 LTS
# works on: fresh VM and if run multiple times
 
 #update and upgrade
echo Update sources list...
sudo apt update
echo Done!
echo
 
echo Upgrade...
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo Done!
echo
 
# install nginx - will later be used as a reverse proxy
echo Install nginx...
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y
echo Done!
echo
 
# nginx by default already enabled other uncomment the next line
# sudo systemctl enable nginx
 
echo Setup for install of Node JS 20...
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
sudo DEBIAN_FRONTEND=noninteractive bash nodesource_setup.sh
echo Done!
echo
 
# NODE JS Install
echo Install Node JS 20...
# TEST TO MAKE SURE NO USER INPUT
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs -y
echo Done!
echo
 

# git clone app files
echo git clone repo 
 git clone https://github.com/OlliKm/tech515_sparta_app_to_clone.git repo
 echo

# cd into the app folder
cd repo/app

#installs node js packages
echo Run npm install...
npm install
echo Done!
echo
 
#connect to database - may need to change ip for new load of system
export DB_HOST=mongodb://172.31.25.55/posts
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