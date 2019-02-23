# docker-wordpress-xdebug
A dockerized Wordpress environment with Xdebug and subsites

# prerequisites
- docker
- composer
- open ports on localhost 8080 and 8083

# install
1. `composer install`
2. `echo "127.0.0.1    wordpress.docker" | sudo tee -a /etc/hosts` (repeat for every subsite and change domain)
3. edit db settings in `wp-config.php` in the _public_ folder.

# run
`docker-compose up -d`

## available ports
default settings:
- http://wordpress.docker:8080 - Web server
- http://wordpress.docker:8083 - MariaDB server
