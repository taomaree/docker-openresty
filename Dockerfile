FROM phusion/baseimage:0.9.17
MAINTAINER taomareee@gmail.com

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ='Asia/Shanghai'
ENV APP_USER=www-data \
    APP_DATA_DIR=/var/www \
    APP_LOG_DIR=/var/log/nginx

# WORKDIR /data/build
ADD luajit_2.1.20150622_Ubuntu14.04_amd64.deb openresty_1.9.3.1_Ubuntu14.04_amd64.deb ./
RUN dpkg -i luajit_2.1.20150622_Ubuntu14.04_amd64.deb openresty_1.9.3.1_Ubuntu14.04_amd64.deb


# RUN echo "set httpd port 2812 and use address localhost allow localhost allow localhost  allow admin:monit" >> /etc/monit/conf.d/monit


EXPOSE 22/tcp 80/tcp 443/tcp 1935/tcp
VOLUME ["${APP_DATA_DIR}"]

CMD /usr/local/openresty/nginx/sbin/nginx -c /usr/local/openresty/nginx/conf/nginx.conf -g "daemon off;"

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ./*.deb
