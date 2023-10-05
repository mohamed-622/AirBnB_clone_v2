#!/usr/bin/env bash
# Script that sets up your web servers for the deployment of web_static
sudo apt-get update
sudo apt-get -y install nginx
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
echo "keep it up" | sudo tee /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
old="server_name _;"
nginx_config="server_name _;\n\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}"
sudo sed -i "s|$old|$nginx_config|" /etc/nginx/sites-enabled/default
sudo service nginx restart
