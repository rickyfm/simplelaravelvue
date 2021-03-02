# simplelaravelvue

cd simplelaravelvue

#using docker

docker-compose up

--if want to run project manually--

#import database

first import the sql to local database

#run backend

cd backend

create .env

composer install

php artisan migrate

php artisan serve

#run frontend

cd frontend

npm install

npm run serve

