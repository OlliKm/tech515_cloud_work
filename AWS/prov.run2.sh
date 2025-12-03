#!/bin/bash

cd repo/app

export DB_HOST=mongodb://172.31.22.91:27017/posts
printenv DB_HOST

pm2 stop all
pm2 start app.js