FROM nginxinc/nginx-unprivileged:1.29.5

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
