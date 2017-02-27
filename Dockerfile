FROM ruby:2.3.3-alpine
RUN /usr/sbin/adduser -D -u ${USER_ID:-1000} fnix-user
RUN apk add --no-cache build-base postgresql-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
RUN bundle install --jobs 20 --retry 5
ADD . /myapp
RUN chown -R fnix-user:fnix-user . && chown -R fnix-user:fnix-user /usr/local/bundle
USER fnix-user

CMD bundle exec puma -p $PORT
