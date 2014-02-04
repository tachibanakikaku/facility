source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'devise'
gem 'jquery-rails'
gem 'haml-rails'
gem 'bootstrap-sass-rails'
gem 'userstamp'

group :development do
  gem 'html2haml'
  gem 'erb2haml'
end

group :assets do
  gem 'mysql2'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'rspec-rails'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

personal = File.expand_path("../Gemfile.personal", __FILE__)
eval File.read(personal) if File.exists?(personal)
