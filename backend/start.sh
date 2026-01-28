#!/bin/sh
set -e

echo "==================================="
echo "Starting Kratos Deployment"
echo "==================================="
echo "Checking environment variables..."
echo "DSN configured: ${DSN:+yes}"
echo "SERVE_PUBLIC_BASE_URL: $SERVE_PUBLIC_BASE_URL"
echo "SERVE_ADMIN_BASE_URL: $SERVE_ADMIN_BASE_URL"
echo "SECRETS_DEFAULT length: ${#SECRETS_DEFAULT}"
echo "SECRETS_DEFAULT value (first 10 chars): ${SECRETS_DEFAULT:0:10}..."
echo "==================================="

echo "Running database migrations..."
kratos migrate sql -e --yes -c /etc/config/kratos/kratos.yml

echo "Migrations completed successfully!"
echo "Starting Kratos server..."
exec kratos serve --watch-courier -c /etc/config/kratos/kratos.yml
