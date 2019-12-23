#!/usr/bin/env bash

#RETRIES=20
#
#until psql -h $PG_HOST -U $PG_USER -d $PG_DATABASE -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
#  echo "Waiting for postgres server, $((RETRIES--)) remaining attempts..."
#  sleep 1
#done

#RETRIES=20
#
#until psql -h postgres -U postgres -d qbot -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
#  echo "Waiting for postgres server, $((RETRIES--)) remaining attempts..."
#  sleep 1
#done

python helloworld_project/manage.py migrate
python helloworld_project/manage.py collectstatic --no-input
python helloworld_project/manage.py runserver 0.0.0.0:8000

