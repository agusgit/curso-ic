#!/bin/bash

docker stop curso
docker rm curso
docker run -e 'ACCEPT_EULA=Y' --name sql-server -e 'SA_PASSWORD=Pa$$w0rd1' -p 1433:1433 -d microsoft/mssql-server-linux:2017-CU4
