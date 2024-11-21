FROM ubuntu:latest
RUN apt-get update && apt-get install -y nginx
CMD [ "nginx", "-g", "daemon off;" ]
Copy /static-website /var/www/html/
