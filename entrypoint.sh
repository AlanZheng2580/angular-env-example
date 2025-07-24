#!/bin/sh

# Replace environment variables in the template
envsubst < /usr/share/nginx/html/assets/env.template.js > /usr/share/nginx/html/assets/env.js

# Execute the CMD
exec "$@"
