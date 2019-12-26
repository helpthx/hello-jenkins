#!/usr/bin/env bash

python helloworld_project/manage.py migrate	
python helloworld_project/manage.py collectstatic --no-input	
python helloworld_project/manage.py runserver 0.0.0.0:8000
