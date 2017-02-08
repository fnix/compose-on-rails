FROM ruby:2.3.3-alpine
RUN apk add --no-cache build-base postgresql-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install --jobs 20 --retry 5
ADD . /myapp
