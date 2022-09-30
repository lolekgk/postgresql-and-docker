# Commands

<br/>

### create docker network

```
docker network create postgres-network
```

<br/>

### start postgresql server

```
docker run -dp 5432:5432 \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=secret \
-v postgres-data:/var/lib/postgresql/data \
--net postgres-network \
--name postgresdb \
--restart=always \
postgres:14.5
```

<br/>

### start pgadmin4

```
docker run -dp 8080:80 \
-e 'PGADMIN_DEFAULT_EMAIL=test@gmail.com' \
-e 'PGADMIN_DEFAULT_PASSWORD=secret' \
-v pgadmin-data:/var/lib/pgadmin \
--name pgadmin4 \
--restart=always \
--net postgres-network \
dpage/pgadmin4
```
