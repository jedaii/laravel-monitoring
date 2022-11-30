#!/bin/sh
docker exec --user root travellist_app composer install
docker exec --user root travellist_app php artisan key:generate
