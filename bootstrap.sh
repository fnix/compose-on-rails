#!/bin/bash
rm -rf .git
rm .gitignore
docker-compose build
# --force overrides README.md, .gitignore and Gemfile
docker-compose run web rails new . --force --database=postgresql --skip-bundle --skip-test-unit
mv spring_client.rb config/
mv database.yml config/
docker-compose run web bundle
docker-compose run web bundle exec spring binstub --all
