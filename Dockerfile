FROM ruby:3.1.0

ENV RAILS_ENV=production
ENV PKG_CONFIG_PATH='/usr/lib/x86_64-linux-gnu/pkgconfig'

WORKDIR /paradigm_shift_docker

RUN apt-get update && apt-get -y install imagemagick pkg-config libmagick++-dev


# Gemfileのみでbundle
COPY Gemfile Gemfile.lock /paradigm_shift_docker/
RUN bundle install

# ソースコード全体をコピーしてbundle
COPY . /paradigm_shift_docker
RUN bundle install

RUN chmod 744 ./start.sh
CMD ["./start.sh"]
