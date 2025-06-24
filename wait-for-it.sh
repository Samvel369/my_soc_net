#!/bin/sh

HOST=$1
PORT=$2

echo "⏳ Waiting for $HOST:$PORT..."

while ! nc -z $HOST $PORT; do
  sleep 1
done

echo "✅ $HOST:$PORT is available — starting app..."

exec gunicorn wsgi:app -b 0.0.0.0:5000
