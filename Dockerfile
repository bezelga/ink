FROM ruby:2.4.2-alpine

ADD Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

ENV APP /app
WORKDIR $APP
ADD . $APP

EXPOSE 5000
ENTRYPOINT ["rackup"]
CMD ["--host", "0.0.0.0", "-p", "5000"]