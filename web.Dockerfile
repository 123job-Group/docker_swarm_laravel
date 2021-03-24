FROM nginx:1.10-alpine

ADD ./docker-compose/nginx/laravelweb.conf /etc/nginx/conf.d/default.conf
ADD ./ /var/www/app
