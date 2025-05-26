#!/bin/sh
set -e

host="postgres"
port="5432"
cmd="$@"

until nc -z "$host" "$port"; do
  echo "⏳ Waiting for $host:$port..."
  sleep 2
done

echo "✅ Database is ready!"
exec $cmd