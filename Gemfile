source 'http://rubygems.org'
# sets up environment variables located in .env file..
# must be up top or other gems using env vars will have wrong values
gem 'dotenv-rails', :groups => [:development, :test]

gem 'rails', '3.1.3'


# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'

gem 'omniauth-twitter'
gem 'twitter', :git => 'https://github.com/sferik/twitter.git', :tag => 'v4.8.1'

# find memory problems
gem 'oink'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end

group :development do
  gem "better_errors"
  gem "pry-rails"
end
