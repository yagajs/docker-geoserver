#!/bin/bash
set -e

if [ "$1" = 'geoserver' ]; then
  echo "Running additional provisioning"
  for f in /docker-entrypoint-initgeoserver.d/*; do
    case "$f" in
      *.sh)     echo "$0: running $f"; . "$f" ;;
    esac
    echo
  done

  echo "Start Geoserver"
  exec $GEOSERVER_HOME/bin/startup.sh
  exit
fi

exec "$@"