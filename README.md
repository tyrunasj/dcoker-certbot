# docker-certbot
This "App" is intended for those who'd like to build and run fast web frontend projects in the docker with ssl certificates. 

## Table of Contents
 - [Features](#features)
 - [Configuring](#configuring)
 - [Installing](#installing)
 - [Usage](#usage)



## Features 
* Builds docker image based on nginx:alpine 
* Installs cert-bot with necessary dependencies 
* Runs docker container 
* Retrieves Let's Encrypt certificates
* Renews certificates periodically
* Nginx config, certificates, and site data persists on a host file system 
* Support of multiple domains and sites

## Configuring
#### nginx config
Edit enginx.conf file by adding as many server blocks as many domains/subdomains you need. 
```yaml
  server {
      listen 80;
      server_name www.example.com;
      location / {
        root   /usr/share/nginx/html/example;
        index  index.html;
        try_files $uri $uri/ /index.html;
      }
      # This location is for cert bot chalanage
      location /.well-known/acme-challenge/ {
      root /usr/share/nginx/html/certbot;
      } 
  }
```
Change values of server_name and root directives for each domain/subdomain.

#### install.sh config
Configuration of bash script install.sh is very straight forward. First six lines define values for variables that are used later on in the script.

**domains** - you should define the array of domains. Each domain has to be separated by the space. 
```bash
domains=(www.example.com app.project.org)
```

**email** - defining your email is strongly recommend. It will be used in case Let's Encrypt decides to notify you regarding issues with your certificates.

**staging** - is used to define which Let's Encrypt enviroment to use.  0 means production, 1 means development environment. Please use 1 in case you testing this script otherwise you risk hitting the limit of allowed renewals. 

**docker_user (optional)** - in case you would like to reuse the image later on by pushing it to docker hub. 

**image_name** - it is just the docker image name that will be built using instructions in Dockerfile. You can change it to any name you'd like.

## Installing
Install docker first: 
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```
Create image and run docker: 
```bash
chmod +x install.sh
./install.sh
```

## Usage
After  you will run the docker container three persistent folders will be created:

**./nginx** - folder with actual nginx default.conf file that is used by nginx inside a running container. This folder is mapped to /etc/nginx/conf.d folder inside your docker container. 

**www** -  this folder is dedicated to your website or frontend application data. This folder is mapped to /usr/share/nginx/html folder inside your docker container. 

**letsencrypt** - folder for Let's Encrypt data including your certificates. This folder is mapped to /etc/letsencrypt folder inside your docker container. 


*I left plenty of comments inside install.sh script and Dockerfile, so feel free to play change, and improve. Just do not forget to share your improvements with me :)*

