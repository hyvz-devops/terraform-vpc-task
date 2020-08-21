#!/bin/bash
sudo yum install wget -y
sudo yum install unzip -y
sudo yum install httpd -y
sudo amazon-linux-extras install php7.2 -y
sudo wget https://wordpress.org/latest.zip
sudo unzip  latest.zip
sudo mv wordpress/*   /var/www/html
sudo systemctl restart  httpd
sudo systemctl  enable   httpd
