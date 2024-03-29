FROM ruby:3.1.0

### CircleCI経由でイメージのプッシュ/デプロイを行う際に使用
ARG RAILS_PRODUCTION_KEY
ARG RAILS_MASTER_KEY
ARG AWS_ACCESS_KEY_ID_CARRIER
ARG AWS_SECRET_ACCESS_KEY_CARRIER
ARG DB_DATABASE
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_SOCKET
ARG DB_HOST

ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=out
ENV DB_DATABASE=${DB_DATABASE}
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV DB_SOCKET=${DB_SOCKET}
ENV DB_HOST=${DB_HOST}


WORKDIR /paradigm_shift_docker

# Gemfileのみでbundle
COPY Gemfile Gemfile.lock /paradigm_shift_docker/
RUN bundle update
RUN bundle install

# ソースコード全体をコピーしてbundle
COPY . /paradigm_shift_docker
RUN bundle install

RUN echo ${RAILS_PRODUCTION_KEY} > /paradigm_shift_docker/config/credentials/production.key
RUN echo ${RAILS_MASTER_KEY} > /paradigm_shift_docker/config/master.key
RUN echo "AWS_ACCESS_KEY_ID_CARRIER = ${AWS_ACCESS_KEY_ID_CARRIER}\nAWS_SECRET_ACCESS_KEY_CARRIER = ${AWS_SECRET_ACCESS_KEY_CARRIER}" > /paradigm_shift_docker/.env

WORKDIR /paradigm_shift_docker
RUN apt-get update
RUN apt-get install vim -y

RUN chmod 744 ./start.sh
CMD ["./start.sh"]