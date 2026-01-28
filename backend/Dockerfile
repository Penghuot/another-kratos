FROM oryd/kratos:v1.2.0-distroless

# Copy configuration files
COPY kratos.yml /etc/config/kratos/kratos.yml
COPY identity.schema.json /etc/config/kratos/identity.schema.json

# Copy startup script
COPY <<EOF /start.sh
#!/bin/sh
set -e
echo "Running database migrations..."
kratos migrate sql -e --yes -c /etc/config/kratos/kratos.yml
echo "Starting Kratos server..."
exec kratos serve -c /etc/config/kratos/kratos.yml
EOF

RUN chmod +x /start.sh

# Set working directory
WORKDIR /etc/config/kratos

# Expose ports
EXPOSE 4433 4434

# Use the startup script
CMD ["/start.sh"]
