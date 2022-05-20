FROM ruby:3.1.0

WORKDIR /paradigm_shift_docker

COPY Gemfile Gemfile.lock /paradigm_shift_docker/

RUN bundle install

