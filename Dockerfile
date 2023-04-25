FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    ruby-dev \
  && gem install debase

RUN gem install bundler -v 2.2.23
RUN bundle install

COPY . /app

ENV RAILS_ENV=test

ENV HTTPARTY_BASE_URI=http://localhost:3000

CMD ["cucumber"]