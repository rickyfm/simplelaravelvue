FROM php:latest

# Create app directory
WORKDIR /backend

COPY ./backend/ /backend
EXPOSE 8000

CMD [ "php", "artisan", "serve", "--host=0.0.0.0", "--port=8080" ]
