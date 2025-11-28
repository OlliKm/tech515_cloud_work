#!/bin/bash
#update and upgrade
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
#install gpg for mongo db
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
#create mongodb list
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo  apt-get update

#sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   mongodb-org=7.0.24 \
   mongodb-org-database=7.0.24 \
   mongodb-org-server=7.0.24 \
   mongodb-mongosh \
   mongodb-org-shell=7.0.24 \
   mongodb-org-mongos=7.0.24 \
   mongodb-org-tools=7.0.24 \
   mongodb-org-database-tools-extra=7.0.24


sudo sed -i 's/^  bindIp: .*/ bindIp: 0.0.0.0/' /etc/mongod.conf

sudo systemctl start mongod
sudo systemctl enable mongod 