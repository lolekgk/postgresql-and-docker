# commands

## create docker network

docker network create postgres-network

## start postgresql server

docker run -dp 5432:5432 \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=secret \
-v postgres-data:/var/lib/postgresql/data \
--net postgres-network \
--name postgresdb \
--restart=always \
postgres:14.5

## start adminer

docker run -dp 8080:8080 \
--name adminer \
--restart=always \
adminer
