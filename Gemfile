source 'https://rubygems.org'

gem 'rails', '3.2.11'

#gem 'pg'
#gem 'tiny_tds'
#gem 'activerecord-sqlserver-adapter'
#gem 'ruby-odbc'
gem 'devise'
gem 'activerecord-jdbcmssql-adapter', platforms: :jruby
gem 'sqlite3', platforms: :mri
#gem 'therubyracer'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :mri
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test, :development do
  gem 'rspec-rails'
  gem 'thin', :platforms => :mri
end

group :development do
  gem 'quiet_assets'
end

group :test do
  gem 'factory_girl'
  gem 'capybara', '1.1.4'
  gem 'poltergeist', '1.0.2'
  gem 'launchy'
  gem 'database_cleaner'
end
