#!/bin/bash

apt update

apt install -y nodejs npm git

npm install -g pm2

git clone https://github.com/muhammedsinanust/organic-ghee.git /home/sinan/app

cd /home/sinan/app/src

npm install

cd /home/sinan/app

pm2 start src/app.js

pm2 save

pm2 startup systemd -u sinan --hp /home/sinan