#!/bin/bash
 
# purpose: provision Mongo DB v7 to work with Sparta Node JS test app
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


echo install GPG for Mongo DB
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo Done!
echo 

echo create list file for mongo db...
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo Done!
echo

echo run update...
sudo apt-get update
echo done!
echo

echo Install Mongo DB..
#need to tet so it doesn't ask for ui input of fresh vm
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   mongodb-org=7.0.24 \
   mongodb-org-database=7.0.24 \
   mongodb-org-server=7.0.24 \
   mongodb-mongosh \
   mongodb-org-shell=7.0.24 \
   mongodb-org-mongos=7.0.24 \
   mongodb-org-tools=7.0.24 \
   mongodb-org-database-tools-extra=7.0.24
   echo Done!
   echo 

   # configure bind IP # to 0.0.0.0 - with sed command
echo "Configuring mongod.conf bindIp..."
sudo sed -i 's/^  bindIp: .*/  bindIp: 0.0.0.0/' /etc/mongod.conf
echo "Done!"
echo
   
   #start mongo db
echo Start MongoDB...
sudo systemctl start mongod
echo Done!
echo 
   #enable mongo db
echo Enable Mongo DB...
sudo systemctl enable mongod
echo Done!
echo 
