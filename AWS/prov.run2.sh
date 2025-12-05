#!/bin/bash

cd repo/app

export DB_HOST=mongodb://10.0.3.126:27017/posts
printenv DB_HOST

pm2 stop all
pm2 start app.js