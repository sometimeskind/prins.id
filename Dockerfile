FROM nginxinc/nginx-unprivileged:1.29.5

COPY index.html /usr/share/nginx/html/index.html
