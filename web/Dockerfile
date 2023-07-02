FROM openresty/openresty:1.21.4.1-alpine

RUN mkdir /usr/local/openresty/nginx/conf/sites-enabled \
    && mkdir /usr/local/openresty/nginx/conf/certs \
    && apk add --no-cache gettext curl perl \
    && opm get jkeys089/lua-resty-hmac=0.06

COPY ./nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY ./dynamic.conf /usr/local/openresty/nginx/conf/dynamic.conf
COPY ./cors.conf /usr/local/openresty/nginx/conf/cors.conf
COPY ./sites-enabled/foxy.social.conf /usr/local/openresty/nginx/conf/sites-enabled/foxy.social.conf
COPY ./certs/default_cert.conf /usr/local/openresty/nginx/conf/certs/default_cert.conf
COPY ./certs/verify_client.conf /usr/local/openresty/nginx/conf/certs/verify_client.conf
COPY ./lua/init.lua /usr/local/openresty/nginx/conf/lua/init.lua
COPY ./lua/aws-signature.lua /usr/local/openresty/nginx/conf/lua/aws-signature.lua

EXPOSE 443

CMD ["openresty", "-g", "daemon off;"]
