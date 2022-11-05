#!/bin/sh
docker exec --user root travellist-app composer install
docker exec --user root travellist-app php artisan key:generate
