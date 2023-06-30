FROM openresty/openresty:1.21.4.1-alpine

RUN ln -sf /usr/local/openresty/nginx/conf /etc/nginx \
    && ln -sf /usr/local/openresty/nginx/logs /var/log/nginx \
    && mkdir /usr/local/openresty/nginx/conf/sites-enabled \
    && /usr/local/openresty/nginx/conf/certs

COPY ./nginx.conf /tmp/docker.nginx
COPY ./dynamic.conf /usr/local/openresty/nginx/conf/dynamic.conf
COPY ./cors.conf /usr/local/openresty/nginx/conf/cors.conf
COPY ./sites-enabled/foxy.social.conf /usr/local/openresty/nginx/conf/sites-enabled/foxy.social.conf
COPY ./certs/default_cert.conf /usr/local/openresty/nginx/conf/certs/default_cert.conf
COPY ./certs/verify_client.conf /usr/local/openresty/nginx/conf/certs/verify_client.conf

EXPOSE 443

CMD ["openresty", "-g", "daemon off;"]
