FROM debian:buster

EXPOSE 443

RUN apt-get update
RUN apt-get install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl/private
RUN mkdir -p /etc/nginx/ssl/certs
RUN openssl req -x509 -newkey rsa:4096 -nodes -sha256 -days 365 \
    -out /etc/nginx/ssl/certs/cjimenez.42.fr.pem \
    -keyout /etc/nginx/ssl/private/cjimenez.42.fr.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=IT/CN=cjimenez.42.fr"


COPY ./config/nginx.conf /etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]
