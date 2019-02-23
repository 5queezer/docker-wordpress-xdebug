# docker-wordpress-xdebug
A dockerized Wordpress environment with Xdebug and subsites.

# prerequisites
- docker
- composer
- sudo

# install
1. edit the *.env* file to you needs
2. `composer install`
3. edit db settings in `wp-config.php` in the _public_ folder.

# run
`docker-compose up -d`
