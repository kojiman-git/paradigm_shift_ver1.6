FROM ruby:3.1.0

ENV RAILS_ENV=production

RUN  apt-get update -qq \
  && apt-get install -y nodejs yarn imagemagick libmagick++-dev

WORKDIR /paradigm_shift_docker

# Gemfileのみでbundle
COPY Gemfile Gemfile.lock /paradigm_shift_docker/
RUN bundle install

# ソースコード全体をコピーしてbundle
COPY . /paradigm_shift_docker
RUN bundle install

RUN chmod 744 ./start.sh
CMD ["./start.sh"]
