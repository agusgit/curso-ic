#!/bin/bash
docker ps

docker stop curso
docker stop sql-server
docker stop jenkis
docker stop some-redis

docker rm curso
docker rm sql-server
docker rm jenkis
docker rm some-redis

docker ps
