FROM nginx:latest


RUN groupadd -r nginx_group && useradd -r -g nginx_group nginx_user


RUN mkdir -p /var/cache/nginx/client_temp /run/nginx && \
    chown -R nginx_user:nginx_group /var/cache/nginx /run/nginx && \
    chmod 755 /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

COPY plays-dev-hackaton /usr/share/nginx/html/

RUN chown -R nginx_user:nginx_group /usr/share/nginx/html/ /etc/nginx

USER root

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
