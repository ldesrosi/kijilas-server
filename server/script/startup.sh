#!/usr/bin/env bash

# Clean up docker to avoid any errors
docker stop mc 2>/dev/null
docker rm mc 2>/dev/null

docker run -d --rm -p 25565:25565 -e EULA=TRUE -v /root/kijilas-server:/data --name mc itzg/minecraft-server
