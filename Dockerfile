FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm
RUN npm install -g yarn
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
RUN rails assets:precompile
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]