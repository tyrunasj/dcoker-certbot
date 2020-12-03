FROM nginx:alpine

# Installing certbot 
RUN apk update 
RUN apk upgrade
RUN apk add certbot certbot-nginx

# Creating folder and crond record 
# Cheking certificate renewal 1st day of each month 
# Cheking reloading nginx 2nd day of each month 
RUN mkdir /etc/letsencrypt && echo "* * 1 * * certbot renew" >> mycron && echo "* * 2 * * nginx -s reload" >> mycron && crontab mycron && rm mycron

COPY ./entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
EXPOSE 80 80
EXPOSE 443 443
CMD entrypoint.sh
