FROM openresty/openresty:1.25.3.1-4-alpine

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

RUN mkdir /usr/local/openresty/nginx/conf/sites-enabled \
    && mkdir /usr/local/openresty/nginx/conf/certs \
    && apk add --no-cache gettext curl perl \
    && opm get jkeys089/lua-resty-hmac=0.06

COPY ./nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY ./dynamic.conf /usr/local/openresty/nginx/conf/dynamic.conf
COPY ./ext.conf /usr/local/openresty/nginx/conf/ext.conf
COPY ./static.conf /usr/local/openresty/nginx/conf/static.conf
COPY ./frontend.conf /usr/local/openresty/nginx/conf/frontend.conf
COPY ./cors.conf /usr/local/openresty/nginx/conf/cors.conf
COPY ./sites-enabled/data.foxy.social.conf /usr/local/openresty/nginx/conf/sites-enabled/data.foxy.social.conf
COPY ./sites-enabled/ext.foxy.social.conf /usr/local/openresty/nginx/conf/sites-enabled/ext.foxy.social.conf
COPY ./sites-enabled/foxy.social.conf /usr/local/openresty/nginx/conf/sites-enabled/foxy.social.conf
COPY ./sites-enabled/soapbox.foxy.social.conf /usr/local/openresty/nginx/conf/sites-enabled/soapbox.foxy.social.conf
COPY ./certs/default_cert.conf /usr/local/openresty/nginx/conf/certs/default_cert.conf
COPY ./certs/verify_client.conf /usr/local/openresty/nginx/conf/certs/verify_client.conf
COPY ./lua/init.lua /usr/local/openresty/nginx/conf/lua/init.lua
COPY ./lua/aws-signature.lua /tmp/aws-signature.lua

RUN envsubst '$AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY' < /tmp/aws-signature.lua > /usr/local/openresty/nginx/conf/lua/aws-signature.lua

EXPOSE 443

CMD ["openresty", "-g", "daemon off;"]
