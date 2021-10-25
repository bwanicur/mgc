source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.1'
gem 'pg'
gem 'puma'
gem 'webpacker'
gem 'sidekiq'

gem 'sorcery'
gem 'money-rails'
gem 'kaminari'
gem 'geocoder'
gem 'twilio-ruby'

group :development do
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'dotenv-rails'
  gem 'letter_opener'
  gem 'capybara'
  gem 'spring-commands-rspec'
  gem 'rubocop'
end
