FROM ruby:2.7.1-buster

ENV DEBCONF_NOWARNINGS yes
ENV TZ='Asia/Tokyo'
ENV LANG C.UTF-8
ENV PORT=3000

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1  apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install -y build-essential nodejs yarn

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN bundle install

ADD . $APP_ROOT

RUN RAILS_ENV=production bundle exec rails assets:precompile
EXPOSE  3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
