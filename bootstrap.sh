#!/bin/bash
# --force overrides README.md, .gitignore and Gemfile
docker-compose run web rails new . --force --database=postgresql --skip-bundle
sudo chown -R $USER:$USER .
docker-compose run web bundle
docker-compose run web bundle exec spring binstub --all
