This is a skeleton to run Rails in docker-compose, based in [Quickstart: Compose and Rails](https://docs.docker.com/compose/rails/), with some goods:

* A volume for gems (https://medium.com/@fbzga/how-to-cache-bundle-install-with-docker-7bed453a5800#.dmu7m9hf9)
* Spring (https://github.com/jonleighton/spring-docker-example)
* A Guardfile that I like to use


### Usage

Checkout and run:

```bash
# --force overrides README.md, .gitignore and Gemfile
docker-compose run web rails new . --force --database=postgresql --skip-bundle
sudo chown -R $USER:$USER .
```

### Guard

This is the list of gems needed to run the example Guardfile:

```ruby
gem 'spring-commands-rspec'
gem 'guard'
gem 'guard-bundler', require: false
gem 'guard-annotate'
gem 'guard-foreman'
gem 'guard-rspec', require: false
gem 'parallel_tests'
```
