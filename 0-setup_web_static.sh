#!/usr/bin/env bash
# Bash scriptr that sets up my web servers

sudo apt-get update
sudo apt-get install -y nginx
sudo ufw allow "Nginx HTTP"

sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
sudo echo "<html>
<head>
</head>
<body>
    Holberton School X African Leadership University
</body>
</html>" | sudo tee /data/web_static/releases/test/index.html

sudo ln -s -f /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
sudo sed -i '/listen 80 default_server;/a location /hbnb_static/ { alias /data/web_static/current/; }' /etc/nginx/sites-enabled/default   

sudo service nginx restart
