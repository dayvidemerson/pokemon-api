FROM ruby:2.7.4-alpine

RUN apk update && apk add build-base nodejs libxml2-dev tzdata sqlite-dev

RUN bundle config set --local path '/.bundle'

RUN mkdir /project

WORKDIR /project

COPY . /project

COPY docker-entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
