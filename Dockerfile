FROM ruby:3.1.2

# copy Gemfile and Gemfile.lock and install gems before copying rest of the application
# so the steps will be cached until there won't be any changes in Gemfile
COPY Gemfile* ./
RUN bundle install

WORKDIR /usr/src/app

COPY . .

CMD bundle exec rails server --port=3000 --binding='0.0.0.0'
