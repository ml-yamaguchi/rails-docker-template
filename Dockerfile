FROM ruby:2.5.3

RUN apt-get update && \
    apt-get install -y nodejs \
                       mysql-client \
                       postgresql-client \
                       sqlite3 \
                       --no-install-recommends && \
    apt-get install -y vim && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY Gemfile* ./
RUN bundle install
COPY . .
