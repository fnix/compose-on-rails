FROM ruby:2.3.3-alpine
RUN /usr/sbin/adduser -D -u ${USER_ID:-1000} skywalker
RUN apk add --no-cache \
  build-base \
  git \
  postgresql-dev \
  nodejs \
  tzdata
RUN mkdir /xwing
WORKDIR /xwing
ADD Gemfile /xwing/Gemfile
RUN bundle install --jobs 20 --retry 5
ADD . /xwing
RUN chown -R skywalker:skywalker . && chown -R skywalker:skywalker /usr/local/bundle
USER skywalker

CMD bundle exec puma -p $PORT
