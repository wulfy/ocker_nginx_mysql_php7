# docker_nginx_mysql_php7

Development and production stack for multiple projects

## NGINX
last stable nginx with nginx configuration.
Use nginx.template to generate nginx.conf with docker ENV var.
Nginx is the application server used to route queries to services

## STATS
Based on [docker-grafana-graphite](https://github.com/wulfy/docker-grafana-graphite) repo.
A set of tools to monitor server and services + record logs.
Used to monitor server and services.
- [Grafana](https://grafana.com/) (web interface to monitor services and server load) 
- [Graphite](https://graphiteapp.org/) (database that make easy to store graphs data) 
- [Collectd](https://collectd.org/) (statistique collector daemon) 
- [logstash](https://www.elastic.co/fr/products/logstash) (pipeline to centralize and transform data) 
- [statsd](https://github.com/etsy/statsd) (daemon listen for UDP message and parses the messages, extracts metrics data, and periodically flushes the data to graphite) 

## JENKINS
[Jenkins automation server](https://jenkins.io/)

## WEBSTACK
Used to execute, compile and run services
php7.1
Nodejs
Phantomjs and Casperjs

## RABBITMQ
Messaging service
[rabbitMQ](https://www.rabbitmq.com/)

## MYSQL
[mysql](https://www.mysql.com/fr/)

## BUILD
To build services just launch : `docker-compose build`
### BUILD configuration
Build configuration is stored in build folder.
webstack is the only one used (others are here for example or should be cleaned in a next commit)
nginx configuration is stored in nginx folder which contains conf and available sites

## Configuration
Use dot env file to configure the server.
List compose files in `COMPOSE_FILE` var, separated by : to list files that should be used during compose operations (like override).
example, if you want to run base server stack (nginx, php, mysql) and stats stack :
`docker-compose.yml:docker-compose.stats.yml`
Compose dir should be current directory : `.`

Mysql data are persisted in /Users/llasry/Documents/www/mysql5 (see docker-compose.yml file)
Nginx logs and configuration are stored in nginx project folder (so you just have to protect this folder against external access)
Nginx will serve `/usr/share/nginx/html` container dicrectory. This directory is linked to server parent directory. You can change it in docker-compose file.
Nginx command is not finished : on future commits we will use it to set docker ENV data in nginx configuration (like timeout on server or production environment)


The project is using separate docker-compose files to make services optionnals on docker-compose start/up

## RUN start/stop
On first run just launch `docker-compose up`.
If you have already build the project just `docker-compose start` or `docker-compose stop`.
