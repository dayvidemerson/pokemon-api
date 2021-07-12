#!/bin/sh
set -e

bundle install

if [ "$RAILS_ENV" == "development" ]
then
  bundle exec rails db:create
  bundle exec rails db:migrate
fi

exec "$@"