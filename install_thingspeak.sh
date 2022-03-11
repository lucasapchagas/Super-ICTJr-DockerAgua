#!/bin/bash

docker run --name mysql55 -e MYSQL_ROOT_PASSWORD=speak -d mysql:5.5
docker run --name thingspeak -p 80:80 --link mysql55:mysql -d synomi/thingspeak
echo "Dormindo por 10 segundos"
sleep 10
docker exec -it thingspeak rake db:create
docker exec -it thingspeak rake db:schema:load
echo "A instalação do ThingSpeak terminou"
echo "Script por Lucas Chagas."
