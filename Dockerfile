FROM ubuntu:16.10
#FROM quay.io/travisci/travis-python:latest

ENV DEBIAN_FRONTEND noninteractive

# TRAVIS addons:
RUN apt-get update
RUN apt-get install -y --no-install-recommends ruby build-essential \
    git aptitude ruby-dev ruby-ffi

RUN gem install bundler travis

RUN git clone https://github.com/travis-ci/travis-build ~/.travis/travis-build
RUN bundle install --gemfile ~/.travis/travis-build/Gemfile
ENV DEBIAN_FRONTEND teletype

VOLUME /src
WORKDIR /src

ENTRYPOINT ["travis", "compile"]
