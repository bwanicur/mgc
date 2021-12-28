ruby "3.0.2"

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "geocoder"
gem "kaminari"
gem "money-rails"
gem "pg"
gem "puma"
gem "rails", "~> 6.1"
gem "sidekiq"
gem "sorcery"
gem "twilio-ruby"
gem "webpacker"

group :development do
  gem "database_cleaner"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "letter_opener"
  gem "rspec-rails"
  gem "rubocop"
  gem "spring-commands-rspec"
end
