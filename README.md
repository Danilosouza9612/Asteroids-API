# README

An API application to save informations about nearest asteroids.

## Build
```bash
docker compose build
```

## Install the Gems
```bash
docker compose run app bundle install
```

## Run the application
```bash
docker compose up
```

## Initialize the database
```bash
docker compose exec app rake db:create
docker compose exec app rails db:migrate
```
