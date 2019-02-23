# docker-wordpress-xdebug
A dockerized Wordpress environment with Xdebug and subsites for development. Do not use in production.

# prerequisites
- docker
- composer
- sudo

# install and run
1. `cp .env.sample .env` and edit the *.env* file to you needs
2. `composer install`
3. change `require( dirname( __FILE__ ) . '/wp-blog-header.php' );` in `require( dirname( __FILE__ ) . '/../core/wp-blog-header.php' );` in *index.php*
4. `docker-compose up -d`

