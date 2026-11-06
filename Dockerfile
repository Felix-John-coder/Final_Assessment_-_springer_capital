FROM nginx:alpine
#FROM nginx:1.14.0

# Copy source code
RUN rm -rf /usr/share/nginx/html/*
COPY src/ /usr/share/nginx/html

RUN apk update && apk upgrade --no-cache
# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf 

# Create a non-root user and grant access to required files
RUN chown -R nginx:nginx /usr/share/nginx/html \
    /var/cache/nginx \
    /var/log/nginx \
    /etc/nginx \
    && touch /var/run/nginx.pid \
    && chown nginx:nginx /var/run/nginx.pid

# Run Nginx as a non-root user
USER nginx

EXPOSE 80
