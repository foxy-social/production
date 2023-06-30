FROM openresty/openresty:1.21.4.1-alpine

COPY web/nginx.conf /tmp/docker.nginx

EXPOSE 443

CMD ["openresty", "-g", "daemon off;"]
