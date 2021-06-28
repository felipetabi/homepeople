FROM ruby:2.7.1-slim-buster
RUN apt-get update -qq && apt-get install --no-install-recommends -y postgresql-client \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install --no-install-recommends -y \
  nodejs \
  yarn \
  libmagickwand-dev \
  imagemagick

RUN mkdir -p /var/www/kaffidy
ENV RAILS_ENV='production'
ENV RAKE_ENV='production'

# Set working directory, where the commands will be ran:
WORKDIR /var/www/kaffidy
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 5 --without development test
COPY . .
RUN bundle exec rails assets:precompile
RUN bundle exec rails webpacker:compile
# Add a script to be executed every time the container starts.
EXPOSE 5000

CMD ["./entrypoints/docker-entrypoint.sh"]
