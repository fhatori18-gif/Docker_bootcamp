FROM nginx:alpine

# Instalamos las utilidades para la contraseña
RUN apk add --no-cache apache2-utils

# Copiamos tus archivos al contenedor
COPY ./html /usr/share/nginx/html
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Creamos la contraseña que tenías en tu compose
RUN htpasswd -cb /etc/nginx/.htpasswd admin core123

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]