# Use the official Nginx base image
FROM nginx:latest

# Copy the custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the SSL certificates
COPY certs/server.crt /etc/nginx/server.crt
COPY certs/server.key /etc/nginx/server.key

# Copy the custom index.html
COPY index.html /usr/share/nginx/html/

# Expose port 80 for HTTP and 443 for HTTPS
EXPOSE 80 443

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

