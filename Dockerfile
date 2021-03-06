FROM ruby:2.6.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn

RUN gem install bundler -v 2.1.4
RUN mkdir /builtcode_teste
WORKDIR /builtcode_teste
COPY Gemfile /builtcode_teste/Gemfile
COPY Gemfile.lock /builtcode_teste/Gemfile.lock
RUN bundle install
RUN bundle check || bundle install
RUN yarn install --check-files
COPY . /builtcode_teste

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]