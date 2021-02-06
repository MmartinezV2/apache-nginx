FROM ubuntu:latest
LABEL maintainer="manuel.martinez.valls@gmail.com"
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && \
apt-get -y upgrade && \
apt-get install -y apache2 libapache2-mod-php
COPY build/* /var/www/html
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
EXPOSE 80
