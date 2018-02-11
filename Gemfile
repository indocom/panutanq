source 'https://rubygems.org'

### BASICS

# Ruby version
ruby '2.5.0'
# Rails version
gem 'rails'
# Use postgres as database
gem 'pg', '< 1'
# Use Puma as the app server
gem 'puma'
# For Travis CI
gem 'rake', group: :test

### END BASICS

### VIEWS, ASSETS, FRONTEND STUFF

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use jQuery
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster.
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Use Bootstrap, the CSS framework (getbootstrap.com)
gem 'bootstrap-sass'
# Javascript interpreter
gem 'therubyracer', platforms: :ruby
# Autoprefixer for SCSS
gem 'autoprefixer-rails'

group :development do
  # Favicon set
  gem 'rails_real_favicon', '>= 0.0.7'
end

### END ASSETS

### UTILITIES

# Schema Validations: to maintin referential integrity in database and models
gem 'schema_validations'
# Environment variables
gem 'dotenv-rails', require: 'dotenv/rails-now'

group :test do
  # Test coverage
  gem 'coveralls', require: false
end

group :development do
  # Annotates model with schema
  gem 'annotate'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Shoot those n+1 queries!
  gem 'bullet'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a
  # debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Rspec testing framework
  gem 'rspec-rails'
  # Factory bot: factories for testing
  gem 'factory_bot_rails'
  # Trace routes
  gem 'traceroute'
end

### END UTILITIES

### QUALITY

group :development, :test do
  # Ruby linter
  gem 'rubocop'
  # SCSS linter
  gem 'scss_lint', require: false
end

### END QUALITY

### MAINTENANCE

# Add browser info in logs
gem 'browser_details'

group :development, :production do
  # Database profiler
  gem 'rack-mini-profiler', require: false
  # Auto-email exceptions
  gem 'exception_notification'
end

group :production do
  # Sitemap generator
  gem 'sitemap_generator'
end

### END MAINTENANCE

### SECURITY

# Adds authentication
gem 'devise'
# Adds roles
gem 'rolify'
# Adds privileges
gem 'cancancan'
# Adds various security stuff. You need protection!
gem 'rack-protection'

group :development, :test do
  # Security checkup
  gem 'brakeman'
end
### END SECURITY
