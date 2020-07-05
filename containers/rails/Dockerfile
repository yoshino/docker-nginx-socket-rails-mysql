FROM ruby:2.7.1-buster

ENV DEBCONF_NOWARNINGS yes
ENV TZ='Asia/Tokyo'
ENV LANG C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1  apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install -y build-essential nodejs yarn default-mysql-client

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN bundle install
RUN yarn

ADD . $APP_ROOT

# ref: https://github.com/rails/rails/issues/32947
RUN SECRET_KEY_BASE=`rake secret` RAILS_ENV=production bundle exec rails assets:precompile

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets
