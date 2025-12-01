# To go into the User Data Section 


# change the IP to match the DB priv IP
export DB_HOST=mongodb://172.31.25.55:27017/posts
printenv DB_HOST

# stop all pm2 jobs running
pm2 stop all

#run a new fresh pm2 job
pm2 start app.js