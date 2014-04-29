#!/bin/bash

DATADIR="/data"

if [ ! "$(ls -A $DATADIR)" ]; then
  rsync -a /var/lib/mysql/* /data/
  touch /data/.db_initialized_by_checkdata_sh
  chown -R mysql:mysql /data
fi
service mysql restart
