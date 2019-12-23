#!/bin/bash

# As seen in http://tutos.readthedocs.org/en/latest/source/ndg.html

APP_DIR="/qbot_api_extracao"
NUM_CPU=`nproc --all`

# Seta um novo diretório foi passado como raiz para o APP
# caso esse tenha sido passado como parâmetro
if [ "$1" ]
then
    APP_DIR="$1"
fi

NAME="API_QBOT_EXTRACAO"                                             # Name of the application (*)
DJANGODIR=qbot_api_extracao/                    # Django project directory (*)
SOCKFILE=qbot_api_extracao_run/run/gunicorn.sock    # we will communicate using this unix socket (*)
USER=`whoami`                                   # the user to run as (*)
GROUP=`whoami`                                  # the group to run as (*)
NUM_WORKERS=5             # how many worker processes should Gunicorn spawn (*)
                                                # NUM_WORKERS = 2 * CPUS + 1
DJANGO_SETTINGS_MODULE=qbot_api_extracao.settings            # which settings file should Django use (*)
DJANGO_WSGI_MODULE=qbot_api_extracao.wsgi                    # WSGI module name (*)

echo "Starting $NAME as `whoami` on base dir $APP_DIR"

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec gunicorn --bind :8000 ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user $USER \
  --timeout 240
  --access-logfile /qbot_api_extracao/logs/gunicorn/access \
  --error-logfile /qbot_api_extracao/logs/gunicorn/error \
  --bind=unix:$SOCKFILE
