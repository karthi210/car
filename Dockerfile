# Stage 1: Build (no build needed, static files)
FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy your static website into nginx
COPY . /usr/share/nginx/html

# Expose HTTP
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
