FROM ruby:2.6.3

ENV NODE_VERSION=8.12.0

run sed -i '/deb-src/d' /etc/apt/sources.list && \
  apt-get update

run apt-get install -y build-essential postgresql-client
run gem install bundler

RUN curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install npm -g

run npm install --global yarn

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp