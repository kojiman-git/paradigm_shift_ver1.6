FROM ruby:3.1.0

ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=out

### CircleCI経由でイメージのプッシュ/デプロイを行う際に使用
ARG RAILS_PRODUCTION_KEY



WORKDIR /paradigm_shift_docker

# Gemfileのみでbundle
COPY Gemfile Gemfile.lock /paradigm_shift_docker/
RUN bundle update
RUN bundle install

# ソースコード全体をコピーしてbundle
COPY . /paradigm_shift_docker
RUN bundle install

WORKDIR /paradigm_shift_docker
RUN apt-get update
RUN apt-get install vim -y

RUN chmod 744 ./start.sh
CMD ["./start.sh"]