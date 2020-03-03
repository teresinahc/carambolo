FROM ruby:2.6.3

ENV NODE_VERSION=12.13.0

run sed -i '/deb-src/d' /etc/apt/sources.list && \
  apt-get update

run apt-get install -y build-essential postgresql-client

RUN curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install npm -g

run npm install --global yarn

RUN mkdir /myapp

WORKDIR /myapp

COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN gem install bundler -v 2.0.1
RUN bundle install --verbose --jobs 20 --retry 5

COPY . ./

RUN yarn install --check-files

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]