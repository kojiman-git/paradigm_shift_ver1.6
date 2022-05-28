FROM ruby:3.1.0

ENV RAILS_ENV=production

WORKDIR /paradigm_shift_docker

RUN apt-get update && apt-get -y install imagemagick pkg-config imagemagick libmagick++-dev /paradigm_shift_docker/

# Gemfileのみでbundle
COPY Gemfile Gemfile.lock /paradigm_shift_docker/
RUN bundle install

# ソースコード全体をコピーしてbundle
COPY . /paradigm_shift_docker
RUN bundle install

RUN chmod 744 ./start.sh
CMD ["./start.sh"]
