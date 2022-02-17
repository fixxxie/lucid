#!/bin/bash

apt-get update;								# Get the package list update
apt-get install git;							# Install Git
git clone https://github.com/fixxxie/lucid;				# Download the files needed from Git
cd lucid;								# Change directory
cp systemd/lucid.service /etc/systemd/system/lucid.service;		# Copy service file
cp systemd/pwd_file /etc/pwd_file;					# Copy password file
chown root:root /etc/pwd_file;						# Change owner of the password file
chmod 700 /etc/pwd_file;						# Change access of the pwassword file
systemctl enable lucid.service;						# Enable service
systemctl start lucid.service;						# Start the service
apt-get install nginx;							# Install Nginx
cp nginx/default /etc/nginx/sites-available/default;			# Copy config file
cp nginx/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt;	# Copy certificate
cp nginx/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key;	# Copy private key
systemctl enable nginx;							# Enable Nginx service
systemctl start nginx;							# Start Nginx service
ufw allow  443;								# Nginx port
ufw allow 10080;							# SSH port
ufw default deny;							# Default rule is Deny
ufw enable;								# Enable the firewall
