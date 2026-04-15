# Use Nginx, the standard for web servers
FROM nginx:alpine

# Copy your 'app' folder (where index.html is) into the Nginx web folder
COPY ./app /usr/share/nginx/html

# Expose port 80 (standard for web traffic)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
