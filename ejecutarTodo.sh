
#!/bin/bash

docker run -e 'ACCEPT_EULA=Y' --name sql-server -e 'SA_PASSWORD=Pa$$w0rd1' -p 1433:1433 -d microsoft/mssql-server-linux:2017-CU4

docker exec -it sql-server /opt/mssql-tools/bin/sqlcmd \
   -S localhost -U SA -P 'Pa$$w0rd1' \
   -Q 'CREATE DATABASE demo'

docker run --name some-redis -p 6379:6379 -d redis

./gradlew -DapiName=curso-ic buildImage

echo "flywayMigrates"
./gradlew flywayMigrate


# docker run --name curso --link some-redis:some-redis --link sql-server:sql-server -e JAVA_OPTS="-Dspring.profiles.active=ic" -p 8080:8080 -d curso-ic:0.0.1-SNAPSHOT
