FROM ruby:3.1.0

ENV RAILS_ENV=production

WORKDIR /paradigm_shift_docker

RUN apt-get update && apt-get -y install imagemagick pkg-config ImageMagick6-c++-devel



# Gemfileのみでbundle
COPY Gemfile Gemfile.lock /paradigm_shift_docker/
RUN bundle install

# ソースコード全体をコピーしてbundle
COPY . /paradigm_shift_docker
RUN bundle install

RUN chmod 744 ./start.sh
CMD ["./start.sh"]
