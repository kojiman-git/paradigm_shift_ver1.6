FROM ruby:3.1.0

ENV RAILS_ENV=production

### CircleCI経由でイメージのプッシュ/デプロイを行う際に使用
ARG RAILS_PRODUCTION_KEY
ENV RAILS_PRODUCTION_KEY ${RAILS_PRODUCTION_KEY}


WORKDIR /paradigm_shift_docker

# Gemfileのみでbundle
COPY Gemfile Gemfile.lock /paradigm_shift_docker/
RUN bundle install

# ソースコード全体をコピーしてbundle
COPY . /paradigm_shift_docker
RUN bundle install

WORKDIR /paradigm_shift_docker/config/credentials
RUN touch production.key 
RUN echo ${RAILS_PRODUCTION_KEY} >production.key

WORKDIR /paradigm_shift_docker

RUN chmod 744 ./start.sh
CMD ["./start.sh"]
