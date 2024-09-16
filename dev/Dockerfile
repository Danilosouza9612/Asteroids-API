FROM ruby:3.1-bookworm

RUN apt-get update
RUN apt-get install -y sqlite3 postgresql-client

WORKDIR /usr/src/app

EXPOSE 3000
CMD rails s -b 0.0.0.0
