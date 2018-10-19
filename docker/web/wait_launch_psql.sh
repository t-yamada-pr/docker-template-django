#!/bin/bash

set -e

host="$1"
postgres_user="$2"
postgres_password="$3"
postgres_db="$4"
shift 4
cmd="$@"

until PGPASSWORD="$postgres_password" psql -h "$host" -U "$postgres_user" "$postgres_db" -c 'select 1'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd
