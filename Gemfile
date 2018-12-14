source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem "rails", github: "palkan/rails", branch: "chore/action-cable-enginify"
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bourbon', '~> 5.0'
gem 'neat', '~> 2.1'

gem 'high_voltage'

gem 'faker'

gem 'martians', path: "engines/martians"

group :development, :test do
  gem 'pry-byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end
