#!/bin/bash

set -e

if [ -f /opt/app/tmp/pids/server.pid ]; then
  rm /opt/app/tmp/pids/server.pid
fi

bundle check || bundle install
yarn 

exec "$@"
