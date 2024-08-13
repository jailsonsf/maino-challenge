# Use the official Ruby image as the base image
FROM ruby:3.3.4

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Precompile assets and run any other necessary commands
RUN bundle exec rake assets:precompile

# Specify the command to run when the container starts
CMD ["rails", "server", "-b", "0.0.0.0"]
