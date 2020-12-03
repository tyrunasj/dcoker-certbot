# dcoker-certbot
This "App" is intended for those who'd like to build and run fast web frontend projects ruing in the docker with ssl certificates. 

## Table of Contents
 - [Features](#features)
 - [Installing](#installing)

## Features 
* Builds docker image based on nginx:alpine 
* Installs cert-bot with necessary dependencies 
* Runs docker container 
* Retrieves Let's Encrypt certificates
* Renews certificates periodically
* Support of multiple domains 


## Installing
Install docker first: 
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```
