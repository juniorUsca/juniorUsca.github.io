FROM alpine:3.6
RUN apk --update add ruby ruby-dev ruby-rdoc ruby-irb libffi-dev build-base && \
    gem install jekyll bundler && \
    gem clean && \
    apk del build-base ruby-dev libffi-dev
COPY . /app
WORKDIR /app
RUN bundle install
ENV JEKYLL_ENV production
EXPOSE 4000
CMD bundle exec jekyll serve -H 0.0.0.0
