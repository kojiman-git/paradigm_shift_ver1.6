FROM ruby:3.1.0

ENV RAILS_ENV=production

WORKDIR /paradigm_shift_docker

COPY Gemfile Gemfile.lock /paradigm_shift_docker/

RUN bundle install

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]