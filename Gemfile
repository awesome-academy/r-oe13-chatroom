source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.3"

gem "rails", "~> 5.2.2"
gem "bootstrap-sass"
gem "jquery-rails"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "turbolinks", "~> 5"
gem "bootstrap-sass"
gem "jquery-rails"
gem "rails-i18n"
gem "bcrypt"
gem "config"
gem "redis"
gem "font-awesome-rails"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jbuilder", "~> 2.5"
gem "kaminari"
gem "ransack"
gem "bootstrap-kaminari-views"
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 3.0"
  gem "shoulda-matchers", "4.0.0.rc1"
  gem "factory_bot_rails", "~> 4.0"
  gem "faker",:require => false
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "database_cleaner", "~> 1.5"
end

group :production do
  gem "pg"
  gem "rails_12factor"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
