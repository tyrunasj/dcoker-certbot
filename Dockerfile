FROM nginx:alpine
RUN apk update 
RUN apk upgrade
RUN apk add certbot certbot-nginx
# RUN apk add python3 python3-dev py3-pip build-base libressl-dev musl-dev libffi-dev
# RUN pip3 install pip --upgrade
# RUN pip3 install certbot-nginx
RUN mkdir /etc/letsencrypt

COPY ./entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
EXPOSE 80 80
EXPOSE 443 443
#RUN rc-service crond start && rc-update add crond
#MD ["nginx", "-g", "daemon off;"]
CMD entrypoint.sh
