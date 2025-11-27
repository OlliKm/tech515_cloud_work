

#!/bin/bash
 
# purpose: provision software + configuration to run Sparta Node JS test app
# works on: AWS EC2 instance running Ubuntu 22.04 LTS
# works on: fresh VM and if run multiple times
 
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
 
# configure reverse proxy here
 
echo Apply changes to Nginx config...
sudo systemctl restart nginx
echo Done!
echo
 
# nginx by default already enabled other uncomment the next line
# sudo systemctl enable nginx
 
echo Setup for install of Node JS 20...
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
# TEST TO MAKE SURE NO USER INPUT
sudo DEBIAN_FRONTEND=noninteractive bash nodesource_setup.sh
echo Done!
echo
 
# NODE JS Install
echo Install Node JS 20...
# TEST TO MAKE SURE NO USER INPUT
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs -y
echo Done!
echo
 
# copy app code to VM
# git clone <endpoint to your GitHub public repo with app code> repo
echo git clone repo in PWD
 git clone https://github.com/OlliKm/tech515_sparta_app_to_clone.git "$PWD/repo"
 echo


# cd into the app folder
cd repo/app
 
#connect to database - may need to change ip for new load of system
# original had issues of not working - due to me not having the :3000/posts in url on had /posts
export DB_HOST=mongodb://172.31.45.108/posts
printenv DB_HOST
 


echo Run npm install...
npm install
echo Done!
echo
 
 #put in the reverse proxy 
sudo sed -i "s|try_files \$uri \$uri/ =404;|proxy_pass http://127.0.0.1:3000;|" /etc/nginx/sites-available/default

sudo systemctl reload nginx


 sudo npm install -g pm2
 pm2 startup systemd
 sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu
pm2 save

cd repo/app
pm2 start app.js &
#pm2 stop app.js
