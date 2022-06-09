## Install and access Postgresql
```
cd postgresql
sudo docker-compose up -d
sudo docker exec -it postgresql_db_1 /bin/bash
psql -U postgres
```
## Create user Postgresql
```
create database 'data_penjualan_mobil'
import from adminer
create user djubli with encrypted password 'djubli';
grant all privileges on database data_penjualan_mobil to djubli;
grant all privileges on table seller_profile to djubli;
grant all privileges on table car_list to djubli;
grant all privileges on table car_model to djubli;
grant all privileges on table kredit to djubli;
```

## Create user on Ubuntu
```
sudo adduser djubli
(match the password from username (djubli))
sudo chown -r djubli:djubli Djubli-test (and move the file to djubli user)
```

## Install package and run the Application
```
npm init
npm i express pg
su - djubli
cd /path/to/folder/djubli-test
node index.js
```

## Endpoint

GET http://localhost:3000/car/\<id>
GET http://localhost:3000/car_credit/\<id>
PUT http://localhost:3000/car/\<id>
DELETE http://localhost:3000/car/\<id>