#!/usr/bin/env bash

#6. Manual SQL migration scripts (10 points):

- Test Auth proxy with mysql client as usual
- ./cloud_sql_proxy -instances=${project}:${LOCATION}:${DB_INSTANCE_NAME}=tcp:3306 &
- mysql -umysql --host 127.0.0.1
