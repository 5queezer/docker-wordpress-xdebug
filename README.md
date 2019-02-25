# docker-wordpress-xdebug
A dockerized Wordpress environment with Xdebug and subsites for development.

# prerequisites
- docker
- composer
- sudo

# install and run
0. install Wordpress files into `public` and the contents of *wp-content* into `content`
1. `cp .env.sample .env` and edit the *.env* file to you needs
2. `composer install`
3. `docker-compose up -d`

## directories
Directory structure after `composer install`

```
.
├── content
│   ├── plugins
│   ├── themes
│   └── upgrade
├── docker
│   ├── nginx
│   └── php-fpm
├── log
├── public
│   ├── wp-admin
│   ├── wp-content
│   └── wp-includes
├── tools
└── vendor
    ├── composer
    └── johnpbloch
```

