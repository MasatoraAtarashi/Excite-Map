#!/bin/sh
git checkout .
git pull
docker-compose restart
vim docker-compose.yml