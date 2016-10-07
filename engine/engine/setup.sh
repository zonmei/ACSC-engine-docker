#!/bin/bash
bundle install
rm db/development.sqlite3
bundle exec rake db:migrate
bundle exec rake db:seed
