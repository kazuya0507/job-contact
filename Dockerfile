# rubyのバージョンを指定(もともと2.5.1で開発していたのでこのバージョン)
FROM ruby:2.5.1

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Docker内部でworkdirをどこに置くか、どういう名前にするかを決める記述
RUN mkdir /app
WORKDIR /app

# Docker内部でGemfile、Gemfile.lockをどこに配置するかを決める記述
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

# 注意！！ Gemfile.lockにかいてあるbundlerバージョンが2.0.1以降だとエラーが出ます！
# ここで環境設定してあげれば通る。
# ENV BUNDLER_VERSION 2.0.1
RUN gem install bundler
RUN bundle install

ADD . /app