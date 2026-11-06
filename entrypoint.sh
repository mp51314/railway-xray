#!/bin/sh
set -eu
# Railway sets $PORT; UUID and WS_PATH are set as service variables.
export PORT="${PORT:-8080}"
: "${UUID:?environment variable UUID is required}"
: "${WS_PATH:?environment variable WS_PATH is required}"
envsubst < /etc/xray/config.json > /etc/xray/config.json.tmp
mv /etc/xray/config.json.tmp /etc/xray/config.json
exec /usr/local/bin/xray run -c /etc/xray/config.json
