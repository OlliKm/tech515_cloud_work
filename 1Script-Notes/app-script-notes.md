
 ## documentation for app script issues I faced.

##### issues im facing is that app.js isn't running automatically i have to manually start it to get it working so I need to fix pm2 or npm start in the script 

* the fix was to create a separate script to put in the user data to make sure the app runs on start up and that the private ip can be changed.
  * Here is the script I used


```
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
```


## App's /post page wasn't working 

```
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
```

## Fix was to add port 3000 onto AWS instance to allow access into port 3000 as the reverse proxy skipped the port 3000 taking us to the page directly ignoring the tunnel of port 3000: once added we are able to see the posts page that runs through port 3000.