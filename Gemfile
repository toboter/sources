source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'solargraph'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "jsonb_accessor", "~> 1.0.0"
gem 'bootstrap-sass'
gem 'toastr-rails'
gem 'simple_form'
gem 'friendly_id'
gem "select2-rails"     # https://select2.github.io/examples.html
gem "font-awesome-rails"
gem 'cocoon'
gem 'will_paginate-bootstrap'
gem 'active_model_serializers', '~> 0.10.0'
# gem 'search_cop'        # https://github.com/mrkamel/search_cop
gem 'searchkick'          # https://github.com/ankane/searchkick
# gem 'filterrific'
gem 'rest-client'
gem 'cancancan'
gem 'browser'
gem 'closure_tree'
gem "chartkick"

# Auth & Babili
gem 'marduk', path: '/home/tschmidt/dev/gem_dev/marduk'
# gem 'marduk', git: 'https://github.com/toboter/marduk.git'

# Record Sharing
gem 'enki', path: '/home/tschmidt/dev/gem_dev/enki'
# gem 'enki', git: 'https://github.com/toboter/enki.git'

# Comments
gem 'nabu', path: '/home/tschmidt/dev/gem_dev/nabu'
#gem 'nabu', git: 'https://github.com/toboter/nabu.git'
gem 'rails-bootstrap-markdown'

ruby '2.3.1'